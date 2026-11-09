$ErrorActionPreference = 'Stop'
$root = 'C:\Users\CHINEDU\Desktop\CAPSTONE PROJECT 138'
$out = Join-Path $root '09_Evidence\06_Integrity_and_Transfer\01_Manifests\SHA256_EVIDENCE_MANIFEST_CURRENT_20261109.csv'
$side = Join-Path $root '09_Evidence\06_Integrity_and_Transfer\01_Manifests\SHA256_EVIDENCE_MANIFEST_CURRENT_20261109.sha256'
$receipt = Join-Path $root '09_Evidence\06_Integrity_and_Transfer\01_Manifests\MANIFEST_VERIFICATION_RECEIPT_20261109.txt'
$receiptSide = Join-Path $root '09_Evidence\06_Integrity_and_Transfer\01_Manifests\MANIFEST_VERIFICATION_RECEIPT_20261109.sha256'
$rows = Get-ChildItem -LiteralPath $root -File -Recurse | Where-Object {
  $_.FullName -ne $out -and $_.FullName -ne $side -and $_.FullName -ne $receipt -and $_.FullName -ne $receiptSide -and $_.FullName -notmatch '\\.dist\\'
} | Sort-Object FullName | ForEach-Object {
  [pscustomobject]@{
    RelativePath = $_.FullName.Substring($root.Length + 1)
    LengthBytes = $_.Length
    SHA256 = (Get-FileHash -LiteralPath $_.FullName -Algorithm SHA256).Hash
  }
}
$rows | Export-Csv -LiteralPath $out -NoTypeInformation -Encoding UTF8
$manifestHash = (Get-FileHash -LiteralPath $out -Algorithm SHA256).Hash
Set-Content -LiteralPath $side -Value ($manifestHash + '  SHA256_EVIDENCE_MANIFEST_CURRENT_20261109.csv') -Encoding ASCII
$check = Import-Csv -LiteralPath $out
$missing = 0
$mismatch = 0
foreach ($entry in $check) {
  $file = Join-Path $root $entry.RelativePath
  if (-not (Test-Path -LiteralPath $file -PathType Leaf)) { $missing++; continue }
  $actual = (Get-FileHash -LiteralPath $file -Algorithm SHA256).Hash
  if ($actual -ne $entry.SHA256) { $mismatch++ }
}
"RECORDS=$($check.Count)"
"MISSING=$missing"
"MISMATCH=$mismatch"
"MANIFEST_SHA256=$manifestHash"
if ($missing -ne 0 -or $mismatch -ne 0) { exit 2 } else { "VERIFY=PASS"; exit 0 }

