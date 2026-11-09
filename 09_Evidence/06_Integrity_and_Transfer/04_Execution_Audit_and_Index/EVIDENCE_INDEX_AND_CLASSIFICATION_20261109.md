# CAPSTONE PROJECT 138 â€” Evidence Index and Classification
**Date:** 9 November 2026 (Africa/Lagos)  
**Evidence root:** `09_Evidence`

## Evidence map
| Evidence domain | Canonical location | Content | Classification boundary |
|---|---|---|---|
| Pre-flight | `00_Preflight` | Host/VM prechecks, baseline and snapshot records | Lab readiness only |
| Network configuration | `01_Network_Configuration` | Internal network setup, DHCP, interfaces, console state, VM reachability and bidirectional ping evidence | No Nmap service inventory or vulnerability-specific research |
| System discovery | `02_System_Discovery` | Target identification, full TCP, targeted TCP, UDP top-100, native Nmap output, execution receipts and genuine screenshots | Discovery only; open ports and banners do not imply vulnerabilities |
| Vulnerability assessment | `03_Vulnerability_Assessment` | CVE research, service/config review, read-only vulnerability validation, five-finding evidence and reconciliation | No duplicated native full-scan inventory or generic network setup screenshots |
| Risk assessment | `04_Risk_Assessment` | Risk-score basis and five-finding risk-register evidence | Risk basis only; no duplicate discovery or vulnerability packets |
| Integrity and transfer | `06_Integrity_and_Transfer` | Active manifest, checksum sidecar, guest hash lists, independent hash receipts, evidence transfer provenance, action logs and evidence index | Hashes validate file integrity, not technical interpretation |
| Security controls | No implementation packet | Control recommendations and closure criteria are maintained in `06_Security_Controls` | No control implementation is claimed; no empty evidence folder is retained |

## System-discovery subfolders
- `02_System_Discovery\00_Target_Identification_and_Reachability`: target identity and reachability proof.
- `02_System_Discovery\01_Full_TCP_Discovery_20261108`: full TCP Nmap 7.98 run, native outputs, initial service receipt and TCP-run screenshots.
- `02_System_Discovery\02_Targeted_TCP_Recheck_20261109`: selected-port TCP corroboration, native outputs, execution console, final receipt and 9 November TCP screenshots.
- `02_System_Discovery\03_UDP_Top100_20261109`: UDP top-100 native outputs, execution receipt/log, genuine execution/progress/final screenshots, and transfer archive.

## Vulnerability evidence
`03_Vulnerability_Assessment\01_Raw_Research_and_Validation` retains the technical configuration/CVE prerequisites, Samba/UnrealIRCd/ProFTPD/Tomcat/Apache-PHP reviews, NFS and SMB enumeration proof, HTTP HEAD validation, and relevant target-side package/configuration screenshots. `02_Finding_Reconciliation` holds the finding/risk crosswalk receipt.

## Risk evidence
`04_Risk_Assessment\01_Risk_Basis` retains the five-priority-findings risk-basis record only. Risk method, scoring, assumptions and caveats are in the main workstream document at `05_Risk_Assessment\RISK_ASSESSMENT_AND_RISK_REGISTER.md`.

## Integrity and transfer evidence
- `06_Integrity_and_Transfer\01_Manifests`: current project-wide manifest, sidecar, refresh script and manifest refresh receipt.
- `06_Integrity_and_Transfer\02_Hash_and_Guest_Verification`: guest-side SHA-256 records, Windows comparison and independent integrity verification.
- `06_Integrity_and_Transfer\03_Transfer_and_Provenance`: byte-transfer bundles, source/destination provenance, copy rehash and transfer screenshots/guides.
- `06_Integrity_and_Transfer\04_Execution_Audit_and_Index`: execution/audit receipts, folder reorganisation receipt and complete file-action CSV, plus this index.

## Screenshot classification and readability audit
A recursive image inventory identified 302 image files. All 302 decoded successfully; zero unreadable images and zero unclassified paths were found. Classification by canonical path: 186 preflight/network configuration, 24 system discovery, 87 vulnerability assessment, 2 integrity/transfer, and 3 lab topology screenshots. No risk-assessment screenshot packet exists because the risk deliverable is analytical and is evidenced by the risk register, scoring basis and crosswalk rather than live target screenshots.

The full per-image inventory, dimensions and SHA-256 values are in SCREENSHOT_CLASSIFICATION_AND_VALIDATION_20261109.csv; the method and limitations are recorded in CAPSTONE138_SCREENSHOT_CLASSIFICATION_RECEIPT_20261109.txt. The image check confirms file readability and classification location, not the semantic accuracy of every screenshot. Workstream-level indexes link to the canonical screenshot paths in 09_Evidence.
## Evidence integrity and cautions
1. Native Nmap outputs are retained separately from vulnerability research evidence.
2. Duplicate copies were removed only after SHA-256 equality was established against a retained canonical copy.
3. A differing console screenshot was retained with a conflict-qualified filename; it was not overwritten.
4. The UDP scan covers the top 100 ports only. Three results were open|filtered/no-response and must not be called confirmed open.
5. The risk/controls/GRC/cloud workstreams include analysis and recommendations. No actual production remediation, policy adoption, live cloud assessment or control implementation is evidenced.
6. The current manifest must be refreshed after the final document and structure updates. The manifest file and sidecar are not self-hashed; their own validation is recorded separately.


## Application-level follow-up — 9 November 2026
- 03_Vulnerability_Assessment\01_Raw_Research_and_Validation\CAPSTONE138_APPLICATION_LEVEL_DISCOVERY_REVIEW_20261109.txt: reconciled app-level findings and limitations.
- 01_Network_Configuration\METASPLOITABLE_CONSOLE_WAKE_RECHECK_20261109.png: genuine screenshot after the approved single-Enter display wake.
- 03_Vulnerability_Assessment\01_Raw_Research_and_Validation\KALI_APPLICATION_LEVEL_INPUT_PATH_DIAGNOSTIC_20261109.png: diagnostic only; it does not show HTTP response results and is not validation evidence.
- The prior 302-image classification audit predates these two follow-up screenshots; its count is not a current total until the image-classification inventory is refreshed.
