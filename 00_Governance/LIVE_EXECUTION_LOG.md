# CAPSTONE PROJECT 138 — Live Execution Log
**Updated:** 8 November 2026 (Africa/Lagos)  
**Host:** PHAMOUS | **Project root:** C:\Users\CHINEDU\Desktop\CAPSTONE PROJECT 138  
**Status:** IN PROGRESS — HOLD for final submission.
## Verified lab state
- Kali: bonaventure@Whisper, 192.168.138.10/24.
- Metasploitable 2: 192.168.138.20/24.
- VirtualBox Internal Network CAPSTONE138_ISOLATED; this is not host-only networking.
- DHCP correction completed under approved pre-correction snapshot; bidirectional connectivity passed.
- Initial Nmap 7.98 TCP inventory completed: 23 open / 977 closed in top-1,000 TCP ports.
## Discovery and validation
- Five-priority register and supporting service-specific research receipts are preserved in 09_Evidence/02_System_Discovery.
- F-01 NFS wildcard root export with rw,no_root_squash: confirmed configuration; remote impact not tested.
- F-02 Samba CVE-2007-2447: high-confidence candidate; installed package patch provenance unresolved.
- F-03 anonymous SMB listing: confirmed; file content access not tested.
- F-04 default credentials displayed in HTTP landing page: disclosure confirmed; validity not tested.
- F-05 unsupported Apache/PHP stack: exposure confirmed; no single CVE asserted.
- Additional validation: Telnet/r-services listeners, Tomcat HTTP/AJP connectors, PHP/Apache advisory review, ProFTPD/UnrealIRCd leads.
- F-10 Mutillidae config resource: Kali HEAD returned HTTP 200 text/plain; response body and secrets not retrieved.
## Documentation work completed in this pass
- Created missing workstream subfolder structures for scope, lab, discovery, vulnerability, risk, controls, GRC, cloud, evidence, report, presentation, references and archive.
- Added consolidated working findings register, provisional risk matrix, technical control mapping, GRC policy register/draft clauses, cloud-security baseline, report outline, presentation storyboard and evidence index.
- Refreshed CURRENT_STATUS.md and action_tracker.csv to reflect current project position and team allocation.
## Remaining work
- Reconcile the F-01–F-10 IDs with the team's latest comparative review.
- Complete authorised non-invasive discovery/validation where justified.
- Obtain Abundance's risk review and Adeayo's controls review.
- Confirm GRC/cloud owners, actual cloud scope/provider, and required frameworks.
- Confirm second target with instructor; Dev Guru remains excluded.
- Finalise executive summary, report, slides, speaker notes and integrity manifest.
- No exploitation or unauthorised cloud testing.


## 8 November 2026 — live Kali / Metasploitable evidence recheck
- Confirmed both VMs running through VBoxManage; both NIC 1 adapters remain on CAPSTONE138_ISOLATED.
- Kali guest properties: eth0 UP, 192.168.138.10/24. Current display shows ping to 192.168.138.20 returning Destination Host Unreachable and neighbour entry FAILED.
- Metasploitable display shows an interactive msfadmin shell prompt, but no current IP/interface output was obtained. Its Guest Additions reporting is unavailable.
- Connectivity is therefore currently FAIL / RECHECK REQUIRED, despite earlier successful reachability and service discovery receipts. Do not scan until restored and independently revalidated.
- Captured genuine VM screenshots and SHA-256 values in CAPSTONE138_LIVE_LAB_RECHECK_20261108.txt.
- Distributed 47 byte-identical evidence copies into dedicated vulnerability/risk/security-control evidence packets; source files remain untouched. All 47 source/destination hashes matched. Provenance CSV and distribution receipt saved under 09_Evidence.
- No configuration changes or further scans were performed.


## 8 November 2026 — connectivity recovered; full TCP inventory completed
- Metasploitable console read-only evidence: eth0 UP at 192.168.138.20/24; MAC 08:00:27:f8:7d:a3; hostname metasploitable; kernel 2.6.24-16-server i686; Metasploitable 2 OS issue string.
- Kali recheck: 192.168.138.10/24; ping 192.168.138.20 passed 4/4 with 0% loss. No network configuration changes were needed or made.
- Full TCP Nmap 7.98 connect/version scan of ports 1–65535 completed in 66.72 seconds: 30 open, 65,505 closed. Native .nmap/.gnmap/.xml, derived 30-row CSV, receipt and screenshots saved in 09_Evidence/02_System_Discovery.
- New ports outside previous top-1,000 baseline: 3632 distccd, 6697 IRC, 8787 Ruby DRb, and unknown services on 33543, 47335, 47852 and 60679.
- Target clock shows EST while Kali shows WAT; clock/timezone alignment is an evidence-correlation issue to record, not a reason to alter clocks during assessment.
- No UDP scan, vulnerability NSE, authentication, brute force or exploitation was performed.


## 8 November 2026 — evidence copy rehash checkpoint
- Current evidence distribution ledger: 57 copy records across vulnerability (36), risk (11) and controls (10) packets. A mismatch discovered in the copied full TCP receipt was corrected by recopying the updated source and rehashing; current source/destination match confirmed for that item.
- Final project-wide SHA-256 manifest and independent rehash are being regenerated after the latest additions. No further target testing is required for this integrity step.

- Time correlation note saved: Kali showed 13:16:56 WAT; Metasploitable showed 02:52:48 EST, approximately 4h24m behind after timezone conversion. No clock/NTP setting was changed.


## 9 November 2026 — post-authentication execution access check
- User reported that `sudo -v` completed successfully in the Kali terminal. This is recorded as user-reported authentication, not independently verified by the host.
- Attempted a non-interactive SSH connection from PHAMOUS to `bonaventure@192.168.138.10` (TCP/22) to continue controlled discovery. The connection timed out; no SSH session was established and no remote command ran in Kali.
- The host-side check therefore could not launch the planned UDP top-100 scan or the targeted TCP service recheck. No scan result, UDP state or service corroboration is claimed from this attempt.
- No target or VM network configuration was changed. The next action is to restore/enable an authorised management path to the Kali guest (or run the commands in its authenticated local terminal), then preserve native Nmap outputs and independently hash/verify transferred copies.
- Project remains IN PROGRESS — HOLD / DO NOT SUBMIT. Existing historical full-TCP evidence remains valid for its original collection time; UDP and new-service TCP recheck remain open.


## 30. Kali management-path diagnostic — 9 November 2026
- Read-only VirtualBox inspection confirms Kali Linux and Metasploitable are running. Kali NIC 1 is attached to Internal Network CAPSTONE138_ISOLATED with cable connected; Guest Additions last-reported eth0 UP / 192.168.138.10/24 (telemetry timestamp 2026-11-08T03:16:54Z, not a fresh guest shell result).
- The host's VirtualBox host-only adapter is Not Present. Host Wi-Fi is Up. PHAMOUS-to-Kali SSH on TCP/22 timed out. This is consistent with the host not being attached to the guest-only Internal Network; it does not establish whether sshd is enabled in Kali.
- No network topology change, host interface attachment, port forwarding or LAN exposure was performed. Preserve CAPSTONE138_ISOLATED; use the authenticated Kali VM console or a separately approved management path.
- Evidence receipt: 09_Evidence/KALI_MANAGEMENT_PATH_DIAGNOSTIC_20261109.txt.
- UDP top-100 and targeted TCP rechecks remain NOT RUN. No new service findings are claimed. No target/Kali guest configuration was changed.
- Project remains IN PROGRESS — HOLD / DO NOT SUBMIT.


## 9 November 2026 - targeted TCP corroboration and evidence rehash
- Used the Kali VM local console through VirtualBox while preserving CAPSTONE138_ISOLATED; did not alter network mode, adapters, forwarding, or target configuration.
- Executed the seven-port TCP connect/version-light recheck against 192.168.138.20. Nmap 7.98 returned exit 0, host up, 7/7 selected ports open; service details are in the native Nmap output and scan receipt.
- UDP top-100 was intentionally skipped because sudo -n authentication was unavailable. No UDP scan is claimed.
- Transferred native outputs and logs from Kali using the VirtualBox clipboard channel; final guest hashes independently matched Windows host hashes for all five hashed evidence files.
- Preserved genuine screenshots and the receipt under 09_Evidence/02_System_Discovery/CAPSTONE138_SCAN_FOLLOWUP_20261109.
- Project remains IN PROGRESS - HOLD / DO NOT SUBMIT.


## 9 November 2026 - UDP top-100 discovery completed
- Authenticated sudo availability in Kali local console; ran Nmap 7.98 UDP top-100 with version-light probes, T2, max-retries 2 and 10-minute host timeout.
- Completed in 167.99 seconds with exit status 0. Four UDP ports returned confirmed open responses (53, 111, 137, 2049); three were open|filtered/no-response (68, 69, 138); 93 returned closed responses. Retransmission-cap warning retained.
- Transferred native outputs and execution log. Independent guest-to-host SHA-256 verification passed for 4/4 files.
- Updated machine-readable service inventory and discovery report. No vulnerability or CVE inferred from open ports alone.
- Project remains IN PROGRESS - HOLD / DO NOT SUBMIT.

## 9 November 2026 — five-finding and service-inventory reconciliation
- Reviewed the current findings register, original preliminary five-finding file, technical configuration receipts, Mutillidae remote HEAD validation, Telnet/r-services receipt, full TCP scan receipt/output, targeted TCP recheck, UDP top-100 receipt/output, risk register and Abundance integration crosswalk.
- Canonical priority IDs are now explicitly reconciled: F-01 NFS; F-02 anonymous SMB (historical preliminary F-03); F-03 Mutillidae (historical F-10); F-04 public credentials; F-05 Telnet/r-services (historical F-06). Historical preliminary F-02 Samba CVE-2007-2447 remains a separate high-confidence candidate with unresolved patch provenance; unsupported Apache/PHP is secondary lifecycle exposure.
- Aligned the consolidated risk method, bands and provisional scores to the allocated owner's working 5x5 model. Abundance acceptance remains pending; no score is treated as proof of untested impact.
- Added seven full-TCP ports to SERVICE_INVENTORY.csv after confirming all seven with the 9 November targeted recheck. The current inventory now covers 30 TCP ports and seven UDP observations.
- Created the finding/risk reconciliation report and machine-readable crosswalk. No new scans or intrusive tests were run for this reconciliation; native outputs and source receipts were read-only.
- No target configuration, VM state, network mode, service or application state was changed.
- Project remains IN PROGRESS — HOLD / DO NOT SUBMIT.
- Reconciliation execution receipt saved: `09_Evidence/CAPSTONE138_FINDING_RECONCILIATION_RECEIPT_20261109.txt`. Final manifest refresh follows after the receipt and final governance references are present.

## 9 November 2026 — review governance and report/presentation consistency
- Created 00_Governance/TEAM_REVIEW_AND_DECISION_REGISTER_20261109.md with the review questions and acceptance evidence required for Jeffrey, Abundance, Adeayo, Amos Talks, Task 7 volunteer, instructor/project coordinator, and final report integration.
- Read the existing control matrix, GRC policy register, cloud baseline, task allocation, action tracker, report QA outline and presentation storyboard. No external owner approval was available in the project records; all relevant reviews remain pending.
- Updated the final report QA outline and presentation storyboard to use the reconciled full TCP and UDP top-100 coverage and the provisional risk-score model. No final report or presentation deck is being represented as completed.
- Updated action-tracker states for discovery, findings, risk, report QA and manifest validation; added ACT-016 and ACT-017 for technical reconciliation and remaining decisions.
- No scans, target changes, network changes, logins, exploit attempts or live cloud actions were performed during this documentation/review-governance pass.

## 9 November 2026 — integrated report, presentation and workstream completion
- Created FINAL_REPORT_20261109.md (404 lines) and FINAL_PRESENTATION_AND_SPEAKER_NOTES_20261109.md (174 lines).
- The report consolidates the authorised lab scope, full TCP discovery, targeted TCP corroboration, UDP top-100 results, five evidence-backed findings, CVE candidate boundaries, provisional risk scores, control matrix, GRC policy set, cloud shared-responsibility baseline, remediation roadmap and evidence locations.
- Recorded task allocation exactly as present in TASK_ALLOCATION_20261108.md: Jeffrey Tasks 1–2; Bonaventure Tasks 3 and 8; Abundance Task 4; Adeayo Task 5; Amos Talks Task 6. Names are allocation labels; no individual sign-off or authorship attestation is fabricated.
- User clarified that no instructor exists/should be assumed. Removed instructor approval as a project dependency. The second-system ambiguity is recorded as a scope limitation; no unapproved target was scanned.
- Task 7 cloud workstream completed as a desk-based baseline only. No cloud tenant/provider or written authorisation was supplied; no live cloud assessment performed.
- Updated the risk, controls, GRC and cloud document status language to distinguish deliverable completion from production risk approval, control implementation and policy adoption.
- Rewrote the action tracker to reflect the completed project artefacts and current limitations.
- No new scans, target changes, network changes, logins, exploit attempts or live cloud actions were performed during this report assembly pass.

## 9 November 2026 — executive summary and final QA
- Updated the executive summary to the integrated final position.
- Created FINAL_REPORT_AND_PRESENTATION_QA_20261109.md. QA checks cover findings consistency, evidence references, risk bands, TCP/UDP scope, CVE classification, task allocation, cloud limitations and production boundary.
- Confirmed the project host has no PowerPoint/Word/LibreOffice executable or PowerPoint COM automation. The managed Python runtime has no python-pptx/python-docx packages; global package installation was correctly blocked by PEP 668 and no managed interpreter was modified. Therefore, report and presentation are retained as Markdown master sources; no binary DOCX/PPTX is falsely claimed.
- No scans, target changes, network changes or live cloud actions were performed.

## 9 November 2026 — final project manifest and independent cross-check
- Final manifest refresh completed: 527 records, zero missing, zero mismatches, VERIFY=PASS.
- SHA-256: E5C1C1D424D4D78575B62AF1BFA80C8B9B6D354CE05533CD64C70A835B5E0E5D.
- Independent PowerShell check confirmed sidecar match, 30 TCP inventory rows, seven UDP observation rows, zero duplicate protocol/port keys, 20 action-tracker records and all final report/presentation/governance files present.
- Updated ACT-012 to final verified status. No scans or target changes were performed.

## 9 November 2026 — evidence tree reorganisation and document output
- Reorganised the 09_Evidence tree into preflight, network configuration, system discovery, vulnerability assessment, risk assessment and integrity/transfer domains.
- Full TCP scan, selected TCP recheck and UDP top-100 outputs/screenshots now have distinct folders under 02_System_Discovery. Vulnerability packet holds vulnerability-specific research/read-only validation; risk packet holds only the risk-basis record. Discovery Nmap outputs were checked absent from vulnerability evidence.
- Removed 57 byte-identical duplicate copies only after SHA-256 comparison against retained canonical files. The action CSV records 183 moves, seven empty-directory removals, the preserved differing console screenshot and the current-status reconstruction incident.
- Reconstructed CURRENT_STATUS.md from retained records after the previous file was inadvertently removed by a same-path duplicate-handler operation. This is a new current snapshot, not a byte-for-byte restoration.
- Created current evidence classification index and refreshed project README. Moved the public research-source log into References; historical workstream creation/manifest-method receipts are archived.
- Created editable Word-compatible DOCX copies for the final report and 14-slide presentation script. The host-session check did not locate WINWORD.EXE; report DOCX structural read shows 405 paragraphs, zero native Word tables and zero images. Word GUI visual QA remains pending; Markdown masters remain authoritative. No PPTX is claimed.
- Manifest refresh action ACT-012 remains pending until the post-reorganisation manifest and independent rehash pass. No further network scan or target modification was performed.

## 9 November 2026 — final post-reorganisation integrity refresh
- Refreshed the project-wide manifest after the evidence tree reorganisation, 57 SHA-256-confirmed duplicate removals, final report paths, Word-compatible DOCX files, current status, evidence index and QA updates.
- Manifest checkpoint: 478 records; MISSING=0; MISMATCH=0; VERIFY=PASS. This is followed by a final refresh and independent all-entry rehash after the current governance/QA notes are saved.
- The active manifest and sidecar are under 09_Evidence/06_Integrity_and_Transfer/01_Manifests. The previous 527-record checkpoint is superseded.
- Final action tracker ACT-012 is marked complete subject to the final post-update run confirming the same 478 records and clean independent rehash. No further technical scan or target change was performed.

## 9 November 2026 — screenshot classification and workstream index correction
- Confirmed the root tree matches the user-provided Explorer structure: 00_Governance through 12_References, plus 99_Archive and README.md.
- Audited 302 image files recursively. All 302 decoded; zero unreadable images and zero unclassified paths. Counts: 186 preflight/network configuration, 24 system discovery, 87 vulnerability assessment, 2 integrity/transfer and 3 lab topology.
- New targeted TCP and UDP Nmap screenshots are correctly retained under 09_Evidence/02_System_Discovery in their respective scan folders. Vulnerability validation screenshots are under 09_Evidence/03_Vulnerability_Assessment/01_Raw_Research_and_Validation. Risk evidence remains analytical; no risk screenshot packet was fabricated.
- Rebuilt 03_System_Discovery/DISCOVERY_EVIDENCE_INDEX.csv to contain only network readiness and system discovery evidence. Previous entries incorrectly mixed vulnerability/CVE validation into the discovery index and referenced obsolete paths.
- Corrected 04_Vulnerability_Assessment/FINDING_EVIDENCE_RISK_CROSSWALK_20261109.csv to point to the canonical vulnerability evidence and screenshot paths and removed obsolete individual approval-pending wording. Contextual risk scores remain provisional; no personal sign-off is claimed.
- Per-image paths, byte sizes, dimensions, readability and SHA-256 values are retained in 09_Evidence/06_Integrity_and_Transfer/04_Execution_Audit_and_Index/SCREENSHOT_CLASSIFICATION_AND_VALIDATION_20261109.csv. Image readability does not independently validate screenshot meaning.

## 9 November 2026 — application-level discovery evidence reconciliation
- Reconciled the existing Apache/PHP, WebDAV, TWiki, phpMyAdmin, Mutillidae and DVWA read-only review receipts and screenshots.
- The 8 November Kali HEAD-only validation of Mutillidae /mutillidae/config.inc remains the only independently confirmed remote application-resource test in this review set; it returned 200, 177 bytes, text/plain. No body or credential value was retrieved.
- WebDAV remains a strong configuration-risk candidate (DAV enabled, directory listing, mode 1777, advertised DAV methods) but no state-changing method was tested; remote write/delete is not claimed.
- Apache/PHP package revisions and Ubuntu backport comparisons remain as documented in the 8 November vendor review. Exact .deb origin/signature/build provenance is unresolved; module and feature prerequisites exclude several proposed CVEs. No banner-derived CVE is promoted.
- TWiki, phpMyAdmin and DVWA are recorded as exposed application/path observations with the existing access-control and version limitations; no authentication, setup action or database access was attempted.
- On 9 November, a new Kali HEAD/OPTIONS sequence was attempted but host clipboard output was empty and the final screenshot showed no new HTTP results. The attempt is explicitly NOT VALIDATED and is not counted as executed testing.
- The Metasploitable console was black while the VM remained running. One previously approved Enter scancode woke the display and the existing shell prompt became visible. No reboot, reset, power-cycle, snapshot restore, service restart or target configuration change occurred.
- Evidence: CAPSTONE138_APPLICATION_LEVEL_DISCOVERY_REVIEW_20261109.txt; CAPSTONE138_APPLICATION_LEVEL_REMOTE_HEAD_ATTEMPT_NOT_VALIDATED_20261109.txt; METASPLOITABLE_CONSOLE_WAKE_RECHECK_20261109.png; KALI_APPLICATION_LEVEL_INPUT_PATH_DIAGNOSTIC_20261109.png.
- No finding ID, CVE or CVSS score changed. Project remains HOLD / DO NOT SUBMIT.

## 9 November 2026 — application review checkpoint and final recursive integrity verification
- Application-level evidence for Apache/PHP, WebDAV, TWiki, phpMyAdmin, Mutillidae and DVWA was reconciled. No new finding or CVE was promoted.
- Metasploitable's black console was awakened with one Enter scancode using the prior approved non-disruptive method; shell prompt became visible. No reboot, reset, power-cycle, restore, service restart or target configuration change.
- The Kali remote HEAD/OPTIONS attempt is explicitly not validated because no output was captured. Existing 8 November Mutillidae remote HEAD remains confirmed.
- Final full recursive project manifest refreshed after all application-review, audit, status, register and evidence-index updates: 1,528 records; zero duplicate path groups; zero missing paths; zero length/hash mismatches; SHA-256 sidecar match PASS.
- The 1,528 count includes the generated report-builder dependency tree under 10_Final_Report\_docgen\node_modules. The previous 478-record checkpoint is superseded.
- Project remains HOLD / DO NOT SUBMIT.
