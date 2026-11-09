$ErrorActionPreference = 'Stop'
$root = 'C:\Users\CHINEDU\Desktop\CAPSTONE PROJECT 138'
$ev = Join-Path $root '09_Evidence'
$sys = Join-Path $ev '02_System_Discovery'
$vuln = Join-Path $ev '03_Vulnerability_Assessment'
$risk = Join-Path $ev '04_Risk_Assessment'
$lab = Join-Path $ev '01_Network_Configuration'
$reportDraft = Join-Path $root '10_Final_Report\01_Working_Draft'
$archive = Join-Path $root '99_Archive'
$changes = New-Object System.Collections.ArrayList

$full = Join-Path $sys '01_Full_TCP_Discovery_20261108'
$identify = Join-Path $sys '00_Target_Identification_and_Reachability'
$targeted = Join-Path $sys '02_Targeted_TCP_Recheck_20261109'
$udp = Join-Path $sys '03_UDP_Top100_20261109'
$vulnRaw = Join-Path $vuln '01_Raw_Research_and_Validation'
$vulnRecon = Join-Path $vuln '02_Finding_Reconciliation'
$riskBasis = Join-Path $risk '01_Risk_Basis'
$integrity = Join-Path $ev '06_Integrity_and_Transfer'
$manifests = Join-Path $integrity '01_Manifests'
$hashes = Join-Path $integrity '02_Hash_and_Guest_Verification'
$transfers = Join-Path $integrity '03_Transfer_and_Provenance'
$audit = Join-Path $integrity '04_Execution_Audit_and_Index'
$oldIndexes = Join-Path $archive '02_Obsolete_Evidence_Indexes'
$oldDrafts = Join-Path $archive '03_Superseded_Working_Drafts'

@($full,$identify,$targeted,$udp,$vulnRecon,$manifests,$hashes,$transfers,$audit,$oldIndexes,$oldDrafts,$reportDraft) | ForEach-Object { New-Item -ItemType Directory -Force -Path $_ | Out-Null }

function Add-Change([string]$Action,[string]$Source,[string]$Destination,[string]$Hash,[long]$Bytes,[string]$Note) {
  [void]$script:changes.Add([pscustomobject]@{Action=$Action;Source=$Source;Destination=$Destination;SHA256=$Hash;Bytes=$Bytes;Note=$Note})
}
function Place-File([string]$Source,[string]$DestinationDirectory,[string]$Note='') {
  if (-not (Test-Path -LiteralPath $Source -PathType Leaf)) { return }
  New-Item -ItemType Directory -Force -Path $DestinationDirectory | Out-Null
  $file = Get-Item -LiteralPath $Source
  $hash = (Get-FileHash -LiteralPath $Source -Algorithm SHA256).Hash
  $bytes = $file.Length
  $dest = Join-Path $DestinationDirectory $file.Name
  if (Test-Path -LiteralPath $dest -PathType Leaf) {
    $destHash = (Get-FileHash -LiteralPath $dest -Algorithm SHA256).Hash
    if ($destHash -eq $hash) {
      Remove-Item -LiteralPath $Source -Force
      Add-Change 'DEDUPLICATED_IDENTICAL' $Source $dest $hash $bytes $Note
      return
    }
    $base = [IO.Path]::GetFileNameWithoutExtension($file.Name)
    $ext = [IO.Path]::GetExtension($file.Name)
    $dest = Join-Path $DestinationDirectory ($base + '__PRESERVED_CONFLICT_20261109' + $ext)
    $n = 2
    while (Test-Path -LiteralPath $dest) { $dest = Join-Path $DestinationDirectory ($base + '__PRESERVED_CONFLICT_20261109_' + $n + $ext); $n++ }
    Move-Item -LiteralPath $Source -Destination $dest
    Add-Change 'MOVED_NAME_CONFLICT_PRESERVED' $Source $dest $hash $bytes $Note
    return
  }
  Move-Item -LiteralPath $Source -Destination $dest
  Add-Change 'MOVED' $Source $dest $hash $bytes $Note
}

# Step 1: remove duplicate discovery artefacts from the vulnerability packet only after confirming identical copies in the discovery packet.
$discoveryPattern = '^(CAPSTONE138_FULL_TCP_DISCOVERY_RECEIPT|CAPSTONE138_INITIAL_TCP_SERVICE_DISCOVERY|CAPSTONE138_METASPLOITABLE_TCP_ALL|KALI_NMAP_TCP_DISCOVERY|LIVE_KALI_FULL_TCP_SCAN|LIVE_KALI_NMAP_OUTPUT_SHA256|LIVE_METASPLOITABLE_SYSTEM_ID|LIVE_METASPLOITABLE_IFCONFIG_EXECUTED_3|LIVE_KALI_CONNECTIVITY_PASS|CAPSTONE138_FIVE_PRIORITY_FINDINGS_RISK_REGISTER)'
Get-ChildItem -LiteralPath $vulnRaw -File -Recurse | Where-Object { $_.Name -match $discoveryPattern } | ForEach-Object {
  $n = $_.Name
  if ($n -match '^CAPSTONE138_FIVE_PRIORITY_FINDINGS_RISK_REGISTER') { Place-File $_.FullName $riskBasis 'Risk-register evidence belongs in risk packet' }
  elseif ($n -match '^LIVE_METASPLOITABLE_(IFCONFIG_EXECUTED_3|SYSTEM_ID)|^LIVE_KALI_CONNECTIVITY_PASS') { Place-File $_.FullName $lab 'Lab connectivity/interface evidence belongs in network configuration packet' }
  else { Place-File $_.FullName $sys 'Byte-identical duplicate of system-discovery evidence' }
}

# Step 2: deduplicate risk/control packets against their canonical vulnerability/discovery/risk originals.
Get-ChildItem -LiteralPath $riskBasis -File -Recurse | Where-Object { $_.Name -ne 'CAPSTONE138_FIVE_PRIORITY_FINDINGS_RISK_REGISTER_20261108.txt' } | ForEach-Object {
  $src=$_.FullName; $name=$_.Name; $h=(Get-FileHash -LiteralPath $src -Algorithm SHA256).Hash
  $match=Get-ChildItem -LiteralPath $ev -File -Recurse | Where-Object { $_.FullName -ne $src -and $_.Name -eq $name } | Where-Object { (Get-FileHash -LiteralPath $_.FullName -Algorithm SHA256).Hash -eq $h } | Select-Object -First 1
  if ($match) { Remove-Item -LiteralPath $src -Force; Add-Change 'DEDUPLICATED_IDENTICAL' $src $match.FullName $h $_.Length 'Risk packet copy removed; canonical technical evidence retained in its source workstream' }
  else { Place-File $src $vulnRaw 'Risk packet contained an unreferenced technical screenshot; retained in vulnerability evidence' }
}
$controlPacket=Join-Path $ev '05_Security_Controls'
if (Test-Path $controlPacket) {
  Get-ChildItem -LiteralPath $controlPacket -File -Recurse | ForEach-Object {
    $src=$_.FullName; $name=$_.Name; $h=(Get-FileHash -LiteralPath $src -Algorithm SHA256).Hash
    $match=Get-ChildItem -LiteralPath $ev -File -Recurse | Where-Object { $_.FullName -ne $src -and $_.Name -eq $name } | Where-Object { (Get-FileHash -LiteralPath $_.FullName -Algorithm SHA256).Hash -eq $h } | Select-Object -First 1
    if ($match) { Remove-Item -LiteralPath $src -Force; Add-Change 'DEDUPLICATED_IDENTICAL' $src $match.FullName $h $_.Length 'Control packet held duplicate technical evidence; canonical source retained elsewhere' }
    else { Place-File $src $vulnRaw 'Unique technical evidence retained in vulnerability packet' }
  }
}

# Step 3: classify files currently mixed into the system-discovery evidence folder.
foreach ($f in @(Get-ChildItem -LiteralPath $sys -File)) {
  $n=$f.Name
  if ($n -match '^(CAPSTONE138_FULL_TCP_DISCOVERY_RECEIPT|CAPSTONE138_INITIAL_TCP_SERVICE_DISCOVERY|CAPSTONE138_METASPLOITABLE_TCP_ALL|KALI_NMAP_TCP_DISCOVERY|LIVE_KALI_FULL_TCP_SCAN|LIVE_KALI_NMAP_OUTPUT_SHA256)') { Place-File $f.FullName $full 'TCP scan outputs, screenshots and receipt' }
  elseif ($n -match '^CAPSTONE138_FIVE_PRIORITY_FINDINGS_RISK_REGISTER') { Place-File $f.FullName $riskBasis 'Risk register belongs in risk evidence packet' }
  elseif ($n -match '^CAPSTONE138_EXECUTIVE_SUMMARY_DRAFT') { Place-File $f.FullName $reportDraft 'Historical executive summary draft, not discovery evidence' }
  elseif ($n -match '^LIVE_METASPLOITABLE_(HOST_DISCOVERY|SYSTEM_ID)|^METASPLOITABLE_FTP_PORT_2121_RECHECK') { Place-File $f.FullName $identify 'Target identity and service confirmation' }
  elseif ($n -match '^LIVE_METASPLOITABLE_(IFCONFIG|IP_RECHECK)|^LIVE_KALI_CONNECTIVITY|^KALI_(APP_REVIEW|CONSOLE_PRE_INPUT|FRESH_TARGET|INPUT_CHANNEL|NETWORK_INTERFACE|SHORT_COMMAND|TARGET_PING)|^LIVE_KALI_(CLIPBOARD|CONTROL_TEST|SCREEN_)|^METASPLOITABLE_CONSOLE_(PRE_INPUT|STATE_?$)') { Place-File $f.FullName $lab 'Lab console, interface, reachability or management-path evidence' }
  elseif ($n -match '^KALI_(HTTP|MUTILLIDAE|NFS|RPCINFO|SMB)|^METASPLOITABLE_(APACHE|APP_|ETC_EXPORTS|HTTP_|INSTALLED_PACKAGE|MUTILLIDAE|PHPMYADMIN|PHP_|PROFTPD|SAMBA|TELNET|TOMCAT|TWIKI|UNREALIRCD|WEBAPP|WEBDAV)|^CAPSTONE138_(APACHE|PRELIMINARY_VULNERABILITY|PROFTPD|SAMBA_CVE|SERVICE_CONFIGURATION|TELNET_RSH|TOMCAT_5|UNREALIRCD_CVE|WEB_APPLICATION)|^METASPLOITABLE_CONSOLE_STATE_APP_HANDLER') { Place-File $f.FullName $vulnRaw 'Vulnerability research or non-invasive configuration validation' }
  else { Add-Change 'REVIEW_REQUIRED_RETAINED' $f.FullName $f.FullName '' $f.Length 'Not moved automatically; retained in current location for manual classification' }
}

# Step 4: relocate the 9 November targeted TCP and UDP scan evidence into dedicated folders.
$follow=Join-Path $sys 'CAPSTONE138_SCAN_FOLLOWUP_20261109'
if (Test-Path $follow) {
  $tcpSource=Join-Path $follow 'capstone138_20261109'
  if (Test-Path $tcpSource) {
    Get-ChildItem -LiteralPath $tcpSource -File | ForEach-Object {
      if ($_.Name -match '^SHA256SUMS') { Place-File $_.FullName $hashes 'Guest-side TCP output hash list' }
      elseif ($_.Name -eq 'UDP_DISCOVERY_BLOCKED_20261109.txt') { Place-File $_.FullName $oldDrafts 'Superseded pre-scan blocker; UDP top-100 later completed' }
      else { Place-File $_.FullName $targeted 'Native targeted TCP recheck output and execution log' }
    }
  }
  Get-ChildItem -LiteralPath $follow -File | ForEach-Object {
    if ($_.Name -match 'CAPSTONE138_EVIDENCE_BATCH') { Place-File $_.FullName $transfers 'Compressed evidence transfer bundle' }
    elseif ($_.Name -match 'KALI_HASH_RECALC') { Place-File $_.FullName $hashes 'Genuine screenshot of final hash recalculation' }
    elseif ($_.Name -match 'KALI_SCAN_|KALI_TCP_RESULTS') { Place-File $_.FullName $targeted 'Genuine targeted TCP scan execution/results screenshot' }
    elseif ($_.Name -match 'SCAN_RECHECK_RECEIPT') { Place-File $_.FullName $targeted 'Targeted TCP recheck receipt' }
  }
  $udpSource=Join-Path $follow 'UDP_TOP100_20261109'
  if (Test-Path $udpSource) {
    Get-ChildItem -LiteralPath $udpSource -File | ForEach-Object {
      if ($_.Name -match '^UDP_SHA256') { Place-File $_.FullName $hashes 'Guest-side UDP output hash list' }
      else { Place-File $_.FullName $udp 'Native UDP scan output, execution log, receipt and final check' }
    }
  }
}

# Step 5: move direct-root evidence records to the correct evidence domains.
$rootFiles=@(Get-ChildItem -LiteralPath $ev -File)
foreach($f in $rootFiles) {
  $n=$f.Name
  if ($n -match '^20261107_PRECHECK') { Place-File $f.FullName (Join-Path $ev '00_Preflight') 'VirtualBox preflight record' }
  elseif ($n -match '^CAPSTONE138_LIVE_LAB_RECHECK') { Place-File $f.FullName $lab 'Live lab connectivity recheck' }
  elseif ($n -match '^CAPSTONE138_FINDING_RECONCILIATION') { Place-File $f.FullName $vulnRecon 'Finding and inventory reconciliation receipt' }
  elseif ($n -match '^CAPSTONE138_UDP_EVIDENCE') { Place-File $f.FullName $udp 'UDP evidence transfer archive' }
  elseif ($n -match '^CAPSTONE138_EVIDENCE_BATCH') { Place-File $f.FullName $transfers 'Project evidence transfer archive' }
  elseif ($n -match '^CAPSTONE138_EVIDENCE_COPY_REHASH|^CAPSTONE138_EVIDENCE_DISTRIBUTION') { Place-File $f.FullName $transfers 'Evidence distribution and copy provenance' }
  elseif ($n -match '^CAPSTONE138_GUEST_OUTPUT_HASH|^CAPSTONE138_FINAL_INTEGRITY|^CAPSTONE138_INDEPENDENT_INTEGRITY') { Place-File $f.FullName $hashes 'Integrity verification receipt' }
  elseif ($n -match '^CAPSTONE138_MANIFEST_REFRESH_RECEIPT') { Place-File $f.FullName $manifests 'Manifest refresh receipt' }
  elseif ($n -match '^CAPSTONE138_TIME_CORRELATION|^AUDIT_GENERATION|^COMMAND_LINE_REGISTER|^EMPTY_DIRECTORY_CLEANUP') { Place-File $f.FullName $audit 'Evidence administration and execution audit' }
  elseif ($n -match '^EVIDENCE_INDEX_WORKING') { Place-File $f.FullName $oldIndexes 'Superseded evidence index; replaced by current classified index' }
  elseif ($n -match '^REFRESH_AND_VERIFY_MANIFEST') { Place-File $f.FullName $manifests 'Current manifest refresh script' }
  elseif ($n -match '^SHA256_EVIDENCE_MANIFEST_CURRENT_20261109') { Place-File $f.FullName $manifests 'Active project-wide SHA-256 manifest and sidecar' }
  elseif ($n -match '^SHA256_EVIDENCE_MANIFEST') { Place-File $f.FullName $oldIndexes 'Historical or superseded manifest' }
  elseif ($n -match '^KALI_MANAGEMENT_PATH|^KALI_CONSOLE_DIAGNOSTIC|^KALI_KEYBOARD_INPUT_TEST') { Place-File $f.FullName $lab 'Lab console management-path diagnostic' }
  elseif ($n -match '^KALI_EVIDENCE_TRANSFER|^KALI_METASPLOITABLE_EVIDENCE_REPLICATION_GUIDE') { Place-File $f.FullName $transfers 'Evidence transfer screenshot and replication guide' }
  elseif ($n -match '^KALI_UDP_|^LIVE_KALI_(DESKTOP_PRE_UDP|UDP_PRECHECK)') { Place-File $f.FullName $udp 'Genuine UDP scan execution or preflight screenshot' }
}

# Step 6: move tool-version screenshot to discovery, and working/obsolete report sources to their designated locations.
$toolVersion=Join-Path $lab 'KALI_NMAP_VERSION_20261108.png'
Place-File $toolVersion $full 'Nmap 7.98 tool-version screenshot for the full TCP discovery run'
Place-File (Join-Path $root '10_Final_Report\EXECUTIVE_SUMMARY_DRAFT_20261108.md') $reportDraft 'Executive summary working draft'
Place-File (Join-Path $root '10_Final_Report\FINAL_REPORT_STRUCTURE_AND_QA.md') $reportDraft 'Superseded report structure working document'
Place-File (Join-Path $root '10_Final_Report\FINAL_REPORT_ASSEMBLY_STATUS_20261108.md') $oldDrafts 'Superseded report assembly status'
Place-File (Join-Path $root '11_Presentation\PRESENTATION_OUTLINE_AND_SPEAKER_NOTES.md') (Join-Path $root '11_Presentation\01_Slides') 'Presentation working outline'

# Step 7: remove only truly empty directories after all moves; preserve all non-empty evidence.
Get-ChildItem -LiteralPath $root -Directory -Recurse -Force | Sort-Object { $_.FullName.Length } -Descending | ForEach-Object {
  if (@(Get-ChildItem -LiteralPath $_.FullName -Force -ErrorAction SilentlyContinue).Count -eq 0) {
    $path=$_.FullName
    Remove-Item -LiteralPath $path -Force
    Add-Change 'REMOVED_EMPTY_DIRECTORY' $path '' '' 0 'Verified empty after evidence relocation'
  }
}

$logPath=Join-Path $audit 'FOLDER_REORGANIZATION_FILE_ACTIONS_20261109.csv'
$changes | Export-Csv -LiteralPath $logPath -NoTypeInformation -Encoding UTF8
$summary=@()
$summary += 'CAPSTONE PROJECT 138 â€” FOLDER REORGANIZATION EXECUTION RECEIPT'
$summary += 'Date: 9 November 2026 (Africa/Lagos)'
$summary += ('Actions logged: ' + $changes.Count)
$summary += ('Moved: ' + @($changes | Where-Object {$_.Action -like 'MOVED*'}).Count)
$summary += ('Identical duplicate copies removed after SHA-256 match: ' + @($changes | Where-Object {$_.Action -eq 'DEDUPLICATED_IDENTICAL'}).Count)
$summary += ('Empty directories removed: ' + @($changes | Where-Object {$_.Action -eq 'REMOVED_EMPTY_DIRECTORY'}).Count)
$summary += ('Unclassified files retained for review: ' + @($changes | Where-Object {$_.Action -eq 'REVIEW_REQUIRED_RETAINED'}).Count)
$summary += 'Every deduplication action retained an identical file at the destination path recorded in the CSV.'
$summary += 'No native source file was modified; files were moved or byte-identical duplicate copies were removed only after SHA-256 comparison.'
$summary += 'Control implementation evidence was not fabricated; a dedicated empty security-controls evidence folder was removed if no unique evidence remained.'
$summary | Set-Content -LiteralPath (Join-Path $audit 'FOLDER_REORGANIZATION_RECEIPT_20261109.txt') -Encoding UTF8
'=== REORGANIZATION SUMMARY ==='
$summary
'=== REVIEW REQUIRED ==='
$changes | Where-Object {$_.Action -eq 'REVIEW_REQUIRED_RETAINED'} | Format-Table -AutoSize
'=== ACTION COUNTS ==='
$changes | Group-Object Action | Select-Object Name,Count | Format-Table -AutoSize

