# CAPSTONE PROJECT 138
## HanTech â€” From Vulnerability to Compliance: Securing Legacy and Cloud Systems

**Programme:** TS Academy Cybersecurity Capstone  
**Project evidence date:** 9 November 2026  
**Project status:** WORKSTREAM DELIVERABLES ASSEMBLED; CONTENT QA PASS WITH EXPLICIT SCOPE LIMITATIONS; EVIDENCE TREE REORGANISED AND AUDITED; FINAL MANIFEST VERIFICATION RECORDED IN GOVERNANCE AND INTEGRITY EVIDENCE.

## Project objective
Assess the authorised training environment, discover services, identify five evidence-backed weaknesses, assess contextual risk, recommend security controls, prepare GRC policies and a cloud-security baseline, and assemble the final report and presentation.

## Scope and authorisation
- Assessment source: Kali Linux, 192.168.138.10/24.
- Authorised target: Metasploitable 2, 192.168.138.20/24.
- Network: VirtualBox Internal Network `CAPSTONE138_ISOLATED`.
- The host is not attached to the isolated lab network.
- Only Metasploitable 2 is identified in the available authorised scope. The second-system reference is documented as a scope limitation; no substitute target was invented or scanned.
- Task 7 is completed as a desk-based cloud-security baseline. No provider, tenant, workload, authorised identity or written live-test scope was supplied.

## Verified discovery coverage
- Full TCP connect/version-light discovery, 1â€“65535: 30 open and 65,505 closed; completed 8 November 2026.
- Targeted TCP corroboration, 9 November: seven selected ports reconfirmed open; three service identified and four remain unknown.
- UDP top-100, 9 November: four confirmed open responses, three open|filtered/no-response and 93 closed. This is not full UDP coverage.
- Machine-readable service inventory: 30 TCP records plus 7 UDP observations; duplicate protocol/port keys: 0.
- Native Nmap `.nmap`, `.gnmap`, `.xml`, execution receipts and genuine screenshots are retained under `09_Evidence\02_System_Discovery`.

## Five canonical priority findings
| ID | Finding | Contextual score |
|---|---|---:|
| F-01 | Wildcard writable NFS root export with `no_root_squash` | 20 â€” Critical |
| F-02 | Anonymous SMB share enumeration and directory metadata disclosure | 8 â€” Moderate |
| F-03 | Mutillidae configuration resource reachable over HTTP as text/plain | 16 â€” High |
| F-04 | Default lab credential pair displayed on public HTTP landing page | 16 â€” High |
| F-05 | Telnet and Berkeley r-services exposed on all IPv4 interfaces | 12 â€” High |

Scores use a qualitative 5Ã—5 likelihood/impact model. They are not CVSS scores or approved production risk acceptance. Samba CVE-2007-2447 remains a separate high-confidence applicability candidate with unresolved installed-binary patch provenance; it is not represented as confirmed exploitation.

## Workstream deliverables
- **Governance:** project charter, allocation register, scope decisions, status, execution log and action tracker.
- **Scope:** rules of engagement and authorised-target statement.
- **Lab:** network topology, VM evidence and guest reachability records.
- **System discovery:** consolidated service report and 30 TCP / 7 UDP inventory.
- **Vulnerability assessment:** five canonical findings, CVE applicability matrix, reconciliation and evidence crosswalk.
- **Risk assessment:** provisional contextual scoring and risk register.
- **Security controls:** preventive, detective and corrective control matrix. Recommendations only; no control implementation is claimed.
- **GRC:** five draft policy requirements and conditional legal/standards applicability. No formal adoption is claimed.
- **Cloud security:** desk-based shared-responsibility baseline and evidence plan; no live tenant assessment.
- **Final report:** integrated report master in Markdown and editable Word-compatible DOCX.
- **Presentation:** 14-slide content and speaker notes in Markdown; no native PPTX is claimed.
- **References:** standards/framework starter list and public-source applicability log.

## Evidence classification and folder rules
- `09_Evidence\00_Preflight`: pre-flight baseline and snapshots.
- `09_Evidence\01_Network_Configuration`: lab topology, DHCP, VM console, interface and reachability evidence.
- `09_Evidence\02_System_Discovery`: target identification, full TCP, targeted TCP and UDP top-100 scans only.
- `09_Evidence\03_Vulnerability_Assessment`: vulnerability-specific research and read-only validation evidence; no native full-scan set.
- `09_Evidence\04_Risk_Assessment`: risk scoring/basis artefacts only.
- There is intentionally no `09_Evidence\05_Security_Controls` packet because the project has not implemented controls and there is no unique control-implementation evidence. The control design is maintained in `06_Security_Controls`.
- `09_Evidence\06_Integrity_and_Transfer`: manifests, hashes, guest verification, transfer provenance and execution audit.
- Duplicate technical evidence copies were removed only after SHA-256 equality was confirmed against a retained canonical copy. The complete action log records moves and duplicate-removal decisions.

## Top-level folder guide
| Folder | Purpose |
|---|---|
| `00_Governance` | Charter, allocations, current status, action tracker, live execution log and audit script |
| `01_Project_Brief_and_Scope` | Project scope and rules of engagement |
| `02_Lab_Environment` | Lab inventory, topology and network validation |
| `03_System_Discovery` | Consolidated discovery report, CSV inventory and discovery index |
| `04_Vulnerability_Assessment` | Findings, CVE research, reconciliation and evidence crosswalk |
| `05_Risk_Assessment` | Risk method, risk register and workstream addenda |
| `06_Security_Controls` | Proposed control matrix and mappings |
| `07_GRC_Policies` | Draft policy register and applicability |
| `08_Cloud_Security` | Desk-based cloud-security baseline |
| `09_Evidence` | Classified source evidence, screenshots, native scan outputs and integrity records |
| `10_Final_Report` | Final report master, QA and working drafts |
| `11_Presentation` | 14-slide presentation script and speaker notes |
| `12_References` | Standards, frameworks and research source log |
| `99_Archive` | Superseded indexes, historical drafts and receipts |

## Evidence and safety rules
- Native outputs and genuine screenshots are retained; filenames and hashes are included in the current manifest.
- Service banners and open ports do not independently prove vulnerability.
- No exploitation, brute force, credential submission, NFS mount, SMB file-content access, database access, state-changing HTTP request or destructive test was performed.
- Lab observations are not assertions about HanTech production.
- Risk remains provisional for missing HanTech business context; control and policy implementation/adoption are not claimed.
- A SHA-256 match establishes byte-level integrity relative to the manifest, not the accuracy of every technical interpretation.

## Current completion boundary
The report and presentation content are assembled. The final report has a Markdown master and a Word-compatible DOCX; presentation content remains a Markdown slide script and speaker notes. The project is not represented as a production penetration test, live cloud assessment, policy adoption or remediation implementation. Final submission readiness depends on the capstone rubric and any external requirements not contained in the available project scope.

