# CAPSTONE PROJECT 138 — Assessment Requirement-to-Evidence Matrix
**Prepared:** 9 November 2026 (Africa/Lagos)
**Purpose:** Stage A academic compliance audit and traceability baseline.
**Authority reviewed:** `00_Governance/PROJECT_CHARTER.md`, current scope/ROE, final report master, workstream deliverables, task allocation register, service inventory, finding register/crosswalk, and report/presentation QA record.
**Important source limitation:** The original TS Academy assignment brief and formal marking rubric were not located in the project tree during this search. This matrix is therefore mapped to the requirements explicitly recorded in the Project Charter and existing project artefacts. It is not represented as a verified reproduction of the institution's original marking rubric. Obtain the original brief/rubric if it exists outside this folder before final submission.

## 1. Requirement-to-evidence matrix

| Ref | Requirement recorded in Project Charter | Expected evidence / acceptance test | Current project evidence | Status | Remaining action |
|---|---|---|---|---|---|
| T1.1 | Establish lab environment and authorised scope | Topology, addressing, target identity, scanner identity, network isolation and scope/ROE | `02_Lab_Environment`; `01_Project_Brief_and_Scope/02_Scope_and_ROE/SCOPE_AND_RULES_OF_ENGAGEMENT_20261108.md`; network evidence under `09_Evidence/01_Network_Configuration` | Evidence assembled; final narrative alignment required | Ensure final report describes Metasploitable 2 as HanTech's designated assessment environment and Kali as the assessment workstation; retain explicit isolated-lab boundary |
| T1.2 | Define permitted/prohibited testing and evidence handling | Rules of engagement, non-invasive boundaries, timestamp/source/target/hash provenance | Scope/ROE; scan receipts; execution logs; evidence manifest | Prepared; cross-document wording review required | Reconcile stale charter/scope wording and preserve user-confirmed engagement framing |
| T2.1 | Discover systems/services and produce inventory | Native Nmap outputs, TCP/UDP scope, service inventory, screenshots and limitations | Full TCP 1–65535 (30 open/65,505 closed); targeted TCP 7/7; UDP top-100 (4 open, 3 open|filtered, 93 closed); `03_System_Discovery/SERVICE_INVENTORY.csv`; discovery evidence index | Evidence assembled; do not repeat scans | Validate all displayed counts and labels in report/deck against native outputs and inventory |
| T3.1 | Identify five priority security weaknesses | Five findings with affected service, observed condition, description, potential attacker goal, validation limits and evidence links | F-01 to F-05 in `10_Final_Report/FINAL_REPORT_20261109.md`; reconciliation report and crosswalk; raw vulnerability evidence | Five findings assembled; final traceability QA required | Verify each claim against primary receipt/screenshot and manifest; retain untested-impact language |
| T3.2 | Research CVE/CVSS where genuinely applicable | Vendor/advisory sources, prerequisites, patch provenance and distinction between candidate and confirmed | Research/applicability log; Samba CVE-2007-2447 candidate; exclusions and secondary leads | Research prepared; final citation verification pending | Verify every URL, version, access date, applicability and whether CVSS is genuinely applicable; do not invent a CVE for each finding |
| T4.1 | Assess likelihood, impact and overall rating | Transparent scoring method, rationale per finding, prioritisation and limitations | `05_Risk_Assessment/RISK_ASSESSMENT_AND_RISK_REGISTER.md`; five-row finding/risk crosswalk | Deliverable prepared; scores provisional | Check score arithmetic, band boundaries, rationale and consistent statement that scores are contextual, not production-approved |
| T5.1 | Provide at least one actionable control per finding | Preventive/detective/corrective control, owner, priority and closure/verification evidence mapped to each finding | `06_Security_Controls/SECURITY_CONTROL_MATRIX.md` | Design prepared; implementation not claimed | Confirm all five findings map to actionable controls and measurable closure criteria |
| T6.1 | Develop at least four GRC policies | Policy register/drafts; purpose, owner, findings mitigated, governance and review | `07_GRC_Policies/GRC_POLICY_REGISTER_AND_DRAFTS.md` (five policy areas) | Draft deliverable prepared; adoption not claimed | Verify each policy has purpose, owner/role, scope, approval, review cadence, enforcement and evidence of operation |
| T6.2 | Map legal/standards applicability conditionally | Authoritative sources and applicability tests; no blanket compliance assertions | References starter list and research/applicability log; NDPA, GDPR, HIPAA, PCI DSS and frameworks qualified | Prepared; source currency/citations pending | Recheck source editions, legal applicability language and final bibliography |
| T7.1 | Assess cloud security responsibilities and compliance applicability | IaaS/PaaS/SaaS shared responsibility, IAM/MFA/least privilege, threats, best practices and evidence plan | `08_Cloud_Security/CLOUD_SECURITY_ASSESSMENT.md` | Desk-based deliverable prepared | State no provider, tenant, workload or authorised cloud scope was supplied; do not claim live assessment |
| T8.1 | Produce one-page executive summary, professional report and presentation | Consistent executive summary, final report, slide deck and speaker notes | `10_Final_Report/FINAL_REPORT_20261109.md`; DOCX draft; `11_Presentation/FINAL_PRESENTATION_AND_SPEAKER_NOTES_20261109.md`; DOCX script | Content assembled; formatting incomplete | Stage B native Word layout and PDF; Stage C genuine PPTX and slide-by-slide QA |
| X.1 | Preserve evidence and traceability | Original outputs/screenshots/receipts, hashes, index, final manifest | `09_Evidence`; current manifest and screenshot classification audit | Previous manifest pass recorded; refresh after all remaining changes | Re-run manifest only after final edits; independently verify all entries and sidecar |
| X.2 | Team contribution / allocation record | Allocation traceability without invented signatures or personal attestations | `00_Governance/TEAM_REVIEW_AND_DECISION_REGISTER_20261109.md` | Allocation record exists; names are labels only | Do not imply individual approval/authorship not evidenced; confirm any required declaration against original rubric |

## 2. Eight-task completion view

| Task | Workstream | Current assessment |
|---|---|---|
| 1 | Lab Environment & Scope | Evidence assembled; align final wording with user's HanTech environment definition |
| 2 | System Discovery & Service Inventory | Evidence assembled; no repeat scans absent a specific gap |
| 3 | Vulnerability Identification & Research | Five findings assembled; evidence/citation cross-check remains |
| 4 | Risk Assessment | Register prepared; contextual scores remain provisional |
| 5 | Security Controls & Recommendations | Control design prepared; implementation not evidenced |
| 6 | GRC Policies | Draft policies prepared; formal adoption not evidenced |
| 7 | Cloud Security Assessment | Desk-based baseline prepared; no live tenant supplied |
| 8 | Executive Summary, Final Report & Presentation | Content assembled; Word/PDF/PPTX production and visual QA outstanding |

## 3. Required scope language for the final deliverables

- HanTech is the organisation/case engagement.
- Metasploitable 2 at 192.168.138.20 is the designated HanTech assessment environment in this capstone.
- Kali Linux at 192.168.138.10 is the assessment workstation operated by the assessment team.
- Both guests communicate on VirtualBox Internal Network `CAPSTONE138_ISOLATED`.
- The isolated virtual environment is the assessment boundary. Do not claim that an independently verified HanTech production network was scanned.
- The second system mentioned in earlier project materials was not identified in the authorised target scope; no substitute target was scanned.
- Cloud analysis is desk-based because no provider/tenant/workload or live cloud authorisation was supplied.
- Risk scores are qualitative/contextual and provisional pending HanTech business-impact, asset-criticality, data-classification, exposure and compensating-control context.
- No exploitation, credential submission, NFS mount, SMB content access, database access or target mutation is claimed.

## 4. Source inconsistencies to correct during Stage D

1. `00_Governance/PROJECT_CHARTER.md` contains stale text saying the second system awaits instructor clarification and Task 7 remains unallocated/open. The current user instruction says no instructor dependency is to be introduced; the final workstream register already records Task 7 as a desk-based deliverable with no named assignee.
2. The charter and older scope wording describe Metasploitable 2 as a generic training target and say its results are not evidence that HanTech production systems have the same weaknesses. The final report must consistently adopt the user's clarified model: Metasploitable 2 is HanTech's designated company assessment environment in the capstone, while retaining the fact that it is an isolated simulated environment and not an independently verified production network.
3. The original institutional assignment brief and formal marking rubric are not present in the inspected project folder. The charter is a project-authored requirements source, not a substitute for the original rubric.
4. Existing presentation outline is a 12-slide outline, while the final presentation master is described as 14 slides. Confirm slide count and content from the final master before generating PPTX.
5. DOCX report is known to contain Markdown table rows as paragraphs, not native Word tables. Native Word layout and visual verification remain outstanding. No native PPTX exists.

## 5. Stage A exit decision

**PROVISIONAL REQUIREMENT MAPPING: COMPLETED AGAINST THE PROJECT CHARTER AND CURRENT PROJECT ARTEFACTS.**

**FORMAL RUBRIC COMPLIANCE: NOT YET VERIFIED** because the original institutional brief/marking rubric was not located in the inspected project tree.

Stage A can be treated as an evidence-based internal baseline. Before submission, obtain the original brief/rubric if held outside the project folder and perform a final delta check. Do not represent the current matrix as the institution's official marking rubric.
