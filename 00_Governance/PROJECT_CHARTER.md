# Project Charter — CAPSTONE PROJECT 138

**Project:** HanTech — From Vulnerability to Compliance: Securing Legacy and Cloud Systems  
**Programme:** TS Academy Cybersecurity Capstone  
**Submission deadline recorded in project materials:** 21 November 2026  
**Team size stated in project materials:** 8  
**Assessment environment:** HanTech's designated capstone assessment environment is the isolated Metasploitable 2 virtual machine at 192.168.138.20. Kali Linux at 192.168.138.10 is the assessment team's workstation.

## 1. Project objective
Prepare an evidence-supported security assessment of the designated HanTech capstone environment. Identify five priority security weaknesses, explain potential attacker goals and validation limits, evaluate likelihood and impact, recommend controls, develop at least four GRC policies, assess cloud-security responsibilities and conditional compliance applicability, and produce an executive summary, final report and presentation. The technical assessment is limited to the isolated virtual environment described in the scope and rules of engagement.

## 2. Recorded task allocation
| Allocation label | Task(s) | Workstream |
|---|---|---|
| Jeffrey | Tasks 1 & 2 | Lab Environment & Scope; System Discovery & Service Inventory |
| Bonaventure | Tasks 3 & 8 | Vulnerability Identification & Research; Executive Summary, Final Report & Presentation |
| Abundance | Task 4 | Risk Assessment |
| Adeayo | Task 5 | Security Controls & Recommendations |
| Amos Talks | Task 6 | Governance, Risk & Compliance Policies |
| No named assignee in recorded allocation | Task 7 | Cloud Security Assessment — desk-based baseline completed |

Names above are allocation labels reproduced from project records. They are not independent proof of individual authorship, review, approval or signature. Task 7's desk-based deliverable is complete; a live cloud assessment was not possible because no provider, tenant, workload or authorised cloud scope was supplied. No instructor dependency is assumed.

## 3. Required work products
- Five evidence-backed priority findings identifying affected service, observed condition, potential attacker goal and validation limits.
- Risk register documenting likelihood, impact, overall rating and relevant CVE/CVSS information where genuinely applicable.
- At least one actionable preventive, detective or corrective control for each finding.
- At least four GRC policy drafts, each explaining purpose, owner/role and findings mitigated.
- Cloud security section explaining IaaS/PaaS/SaaS shared responsibility, IAM, MFA, least privilege, threats, best practices and conditional compliance applicability.
- One-page executive summary, professional final report and presentation with speaker notes.
- Evidence index, native outputs, screenshots, receipts and integrity manifests.

## 4. Technical scope and rules of engagement
- Organisation/case engagement: HanTech.
- Designated capstone assessment environment: Metasploitable 2 at 192.168.138.20.
- Assessment workstation/source: Kali Linux at 192.168.138.10.
- Network: VirtualBox Internal Network CAPSTONE138_ISOLATED; guest-only isolation, not host-only and not bridged.
- The host is not attached to the isolated assessment network.
- Only the designated Metasploitable 2 VM was technically assessed. The second system referenced in earlier project materials was not identified in the authorised target scope; no substitute target, including Dev Guru, was scanned.
- No scanning beyond the approved lab scope; no exploitation, credential attacks, destructive testing, persistence, lateral movement or data exfiltration.
- Read-only service/configuration checks, evidence capture and documented analysis were performed within the recorded scope.
- Any target configuration, network, service or package change requires separate approval and change control.

## 5. Evidence and acceptance
Each finding must be traceable to retained output or screenshots, timestamp, target identity, method and SHA-256 record. A banner alone is not CVE validation. Evidence must distinguish confirmed observations, configuration weaknesses, candidates, exclusions and tests not performed. Hashes demonstrate integrity relative to recorded digests, not the truth of every interpretation.

## 6. Current execution status
Lab readiness, full TCP discovery, targeted TCP corroboration, UDP top-100 discovery, five priority findings, contextual risk assessment, control recommendations, GRC policy drafts, desk-based cloud baseline and report/presentation content have been assembled. Document formatting, formal rubric comparison, final cross-document QA, final manifest refresh and independent submission audit remain outstanding. The project is not marked submitted.

## 7. Reporting boundary
Metasploitable 2 is the designated HanTech assessment environment for this capstone, implemented as an isolated and deliberately vulnerable virtual appliance. Results establish conditions observed in that designated assessment environment. They do not independently establish the state of any separate HanTech production network, system or cloud tenant. Do not describe the environment as an independently tested production estate or infer production applicability without separate asset/configuration evidence and authorisation.

## 8. Governance
The coordinator records decisions, risks, exceptions and action status. Workstream records are evidence of project allocation and deliverable status only; they do not substitute for independently verified peer review or formal approval. Final submission readiness requires academic requirement mapping, document QA, evidence traceability and independent final audit.
