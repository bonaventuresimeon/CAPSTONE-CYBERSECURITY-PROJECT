# CAPSTONE PROJECT 138 â€” Current Status
**Status date:** 9 November 2026 (Africa/Lagos)  
**Project root:** `C:\Users\CHINEDU\Desktop\CAPSTONE PROJECT 138`  
**Current position:** WORKSTREAM DELIVERABLES ASSEMBLED; APPLICATION-LEVEL EVIDENCE RECONCILED WITH REMOTE-RECHECK LIMITATION; FOLDER REORGANISATION EXECUTED; FULL RECURSIVE SHA-256 MANIFEST REFRESHED AND VERIFIED.

## 1. Current technical baseline
- Authorised target: Metasploitable 2, 192.168.138.20/24.
- Assessment source: Kali Linux, 192.168.138.10/24.
- Network: VirtualBox Internal Network `CAPSTONE138_ISOLATED`; host remains outside the isolated network.
- Full TCP scan: ports 1â€“65535; 30 open, 65,505 closed; Nmap 7.98, 8 November 2026.
- Targeted TCP recheck: seven selected ports reconfirmed open on 9 November 2026.
- UDP top-100 scan: four confirmed open, three open|filtered/no-response, 93 closed; not full UDP coverage.
- Service inventory: 30 TCP records + 7 UDP observations; 0 duplicate protocol/port keys.
- No exploitation, brute force, credential submission, NFS mount, SMB content access, database query, state-changing request or destructive testing.

## 2. Canonical findings and risk position
| ID | Finding | Score / rating |
|---|---|---|
| F-01 | Wildcard writable NFS root export with `no_root_squash` | 20 Critical |
| F-02 | Anonymous SMB enumeration and directory metadata | 8 Moderate |
| F-03 | Mutillidae configuration resource reachable over HTTP as text/plain | 16 High |
| F-04 | Default lab credential pair displayed publicly | 16 High |
| F-05 | Telnet and Berkeley r-services exposed on all IPv4 interfaces | 12 High |

Risk ratings are contextual, qualitative 5Ã—5 estimates, not CVSS or approved HanTech production risk acceptance. Samba CVE-2007-2447 remains a separate high-confidence applicability candidate with installed-binary patch provenance unresolved.

## 3. Workstream status
- Tasks 1â€“2: lab, scope, service discovery and inventory deliverables assembled.
- Task 3: five priority findings and CVE research classification assembled.
- Task 4: risk register prepared; provisional for missing HanTech business context.
- Task 5: control matrix and closure criteria prepared; no control implementation is evidenced.
- Task 6: GRC policy drafts and conditional applicability notes prepared; no formal adoption is evidenced.
- Task 7: desk-based cloud baseline and evidence plan completed; no live cloud tenant or written scope supplied.
- Task 8: integrated report Markdown master, generated professional DOCX and PDF, and generated 14-slide PPTX with notes parts. Visual inspection remains pending.
- Names in allocation files are allocation labels from the recorded task allocation. No personal signatures, independent approvals or personal authorship attestations are fabricated.

## 4. Scope decisions
- No instructor role or approval is assumed.
- Only Metasploitable 2 is identified as an authorised target. The second-system reference is a documented scope limitation; no substitute target was invented or scanned.
- No live HanTech production or cloud assessment is claimed.
- Risk scores are provisional without production asset criticality, data classification, architecture, compensating controls and risk appetite.
- Control implementation and GRC adoption are not claimed.

## 5. Folder reorganisation â€” 9 November 2026
The evidence tree was reorganised to distinguish lab/network evidence, system discovery, vulnerability research, risk basis and integrity/transfer records. The action audit is:
`09_Evidence\06_Integrity_and_Transfer\04_Execution_Audit_and_Index\FOLDER_REORGANIZATION_FILE_ACTIONS_20261109.csv`
and the receipt is in the same directory. The operation logged 177 file moves, 57 byte-identical duplicate removals after SHA-256 comparison, six empty-directory removals and four initially unclassified files. The four unclassified files were subsequently manually classified. A differing Metasploitable console image was preserved under a conflict-qualified filename rather than overwritten.

**Status file reconstruction note:** This concise status snapshot is a reconstruction from the retained final report, action tracker, workstream register, execution log and evidence records. The prior 8 November status file was inadvertently removed during a same-path deduplication operation logged in the reorganisation CSV; this file is not claimed to be a byte-for-byte restoration of the previous 228-line history.

## 6. Final deliverable locations
- Report Markdown master: `10_Final_Report\FINAL_REPORT_20261109.md`.
- Professional report DOCX: `10_Final_Report\FINAL_REPORT_PROFESSIONAL_20261109.docx` (450 paragraphs; 11 native tables; visual inspection pending).
- Professional report PDF: `10_Final_Report\FINAL_REPORT_PROFESSIONAL_20261109.pdf` (14 extracted pages; visual inspection pending).
- Report QA: `10_Final_Report\FINAL_REPORT_AND_PRESENTATION_QA_20261109.md`.
- Presentation Markdown master and speaker notes: `11_Presentation\FINAL_PRESENTATION_AND_SPEAKER_NOTES_20261109.md`.
- Professional PowerPoint: `11_Presentation\FINAL_PRESENTATION_PROFESSIONAL_20261109.pptx` (14 slides; 14 notes-slide parts; visual inspection pending).
- Finding reconciliation: `04_Vulnerability_Assessment\CAPSTONE138_FINDING_AND_RISK_RECONCILIATION_20261109.md`.
- Current evidence index: `09_Evidence\06_Integrity_and_Transfer\04_Execution_Audit_and_Index\EVIDENCE_INDEX_AND_CLASSIFICATION_20261109.md`.

## 7. Final integrity gate
The post-reorganisation project-wide SHA-256 manifest is stored at 09_Evidence\06_Integrity_and_Transfer\01_Manifests\SHA256_EVIDENCE_MANIFEST_CURRENT_20261109.csv; its sidecar is beside it. The active recursive manifest and sidecar are maintained under `09_Evidence\\06_Integrity_and_Transfer\\01_Manifests`. Historical counts in earlier checkpoints are superseded. The current authoritative record count, SHA-256, missing/mismatch totals and independent sidecar verification are recorded in `09_Evidence\\06_Integrity_and_Transfer\\01_Manifests\\MANIFEST_VERIFICATION_RECEIPT_20261109.txt`. Any later project-file modification requires another manifest refresh and independent rehash.

The earlier 527-record manifest checkpoint is superseded because the folder tree, duplicate files and DOCX/reporting artefacts changed. The prior status snapshot was reconstructed from retained artefacts and is not a byte-for-byte restoration.


## 8. Application-level discovery checkpoint — 9 November 2026
The existing read-only review of Apache/PHP, WebDAV, TWiki, phpMyAdmin, Mutillidae and DVWA has been reconciled into 09_Evidence\03_Vulnerability_Assessment\01_Raw_Research_and_Validation\CAPSTONE138_APPLICATION_LEVEL_DISCOVERY_REVIEW_20261109.txt. The five canonical findings are unchanged. WebDAV remains a supplementary configuration-risk candidate; Apache/PHP remains a lifecycle/conditional-advisory lead; no new CVE is assigned.
The 9 November Kali remote HEAD/OPTIONS attempt produced no captured output and is NOT counted as testing. The prior 8 November Mutillidae config HEAD result remains confirmed. Metasploitable's black console was awakened with one Enter scancode using the approved non-disruptive method; no reboot or target configuration change occurred.
Two follow-up screenshots were added after the prior 302-image classification audit. They are listed in the new application review receipt; the earlier 302-image count is a pre-addition checkpoint and must not be represented as the current total.
Manifest refreshed after this update; active manifest sidecar is authoritative. Manifest and sidecar are not self-hashed.
Project remains HOLD / DO NOT SUBMIT.


## 9. Post-application-review manifest correction — 9 November 2026
The earlier 478-record count in section 7 is superseded. The current full recursive project manifest includes all project files, including generated report-builder dependencies under 10_Final_Report\_docgen\node_modules. That 1,528-record figure is a historical checkpoint and is superseded by the latest manifest verification receipt. Use only the count and digest recorded in that receipt. The active manifest and sidecar are excluded from their own file list and are validated by the sidecar comparison. The 302-image classification count remains a pre-addition checkpoint; the two follow-up screenshots are disclosed separately pending a fresh image-classification inventory.
Project remains HOLD / DO NOT SUBMIT.
