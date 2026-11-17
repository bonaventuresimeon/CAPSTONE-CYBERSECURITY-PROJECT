# CAPSTONE PROJECT 138 — Official Brief Requirement-to-Evidence Matrix

**Prepared:** 18 November 2026 (Africa/Lagos)  
**Authority:** four-page TS Academy brief supplied as a conversation attachment and reviewed directly; a repository PDF copy has not yet been uploaded.  
**Purpose:** Final traceability check between the TS Academy assignment brief and the submission-authoritative Word/PDF report.

## 1. Assignment requirement matrix

| Brief requirement | Required content / acceptance test | Final report evidence | Status and qualification |
|---|---|---|---|
| Title page | Project title, name and group number | Cover page identifies the project, Project 138, Group 138 and all nine teammates | Complete |
| Task 1 — Vulnerability Identification | Select five Metasploitable 2 vulnerabilities. For each: vulnerability name, affected service, brief description and potential attacker goal | Five findings F-01 to F-05, with affected service, description, attacker goal and evidence boundary | Complete |
| Task 2 — Risk Assessment | For every finding: likelihood, impact, risk rating and a short explanation; address CVE/CVSS | Risk method and five-row table include likelihood, impact, 5×5 contextual score/rating, rationale and CVE/CVSS applicability statement | Complete with documented applicability limitation: no specific CVE was established for these exact observed configurations/exposures, so unsupported CVE identifiers or CVSS scores were not invented or borrowed from unrelated service candidates |
| Task 3 — Security Control Recommendations | At least one control per vulnerability and explain how it reduces risk | Recommended controls are mapped to F-01 through F-05 with risk-reduction explanation | Complete |
| Task 4 — GRC Policy Recommendations | At least four policies; for each, explain purpose and vulnerabilities mitigated | Five draft policy areas with purpose and finding mapping | Complete |
| Task 5 — Cloud Security Basics: shared responsibility | Explain provider versus HanTech responsibilities | IaaS, PaaS and SaaS responsibility table | Complete; desk-based, no live tenant assessment claimed |
| Task 5 — Cloud Security Basics: IAM | Define authentication, authorization and auditing and apply to HanTech cloud accounts | IAM section defines the three functions and their practical use | Complete |
| Task 5 — Cloud Security Basics: MFA | Explain why MFA is needed and where to enforce it | MFA recommendation identifies privileged, remote and user access enforcement | Complete |
| Task 5 — Cloud Security Basics: least privilege | Explain the principle and apply to users/services | Least-privilege section addresses roles, service identities and access reviews | Complete |
| Task 5 — Cloud Security Basics: threats | Identify relevant common threats, including misconfiguration, weak credentials, excessive permissions, unencrypted data, insecure APIs, insider threats and DDoS | Cloud threat table addresses all seven named categories | Complete |
| Task 5 — Cloud Security Basics: best practices | Identify best practices for HanTech | Cloud security recommendations cover IAM, network/workload, data/key management, logging, response, backups and secure delivery | Complete |
| Task 5 — Cloud Security Basics: compliance | Identify laws/frameworks that may apply to data processed, with conditional applicability | Compliance discussion covers the Nigeria Data Protection Act and conditionally discusses GDPR, HIPAA and PCI DSS | Complete; applicability depends on data, services, jurisdiction and contractual role, not asserted as blanket compliance |
| Executive Summary (also labelled “Task 5” in the brief) | One page for non-technical leadership covering key findings, highest risks, controls, policies and overall posture | One-page executive summary immediately after title page | Complete |
| Required report sections | Title page; executive summary; vulnerability findings; risk assessment; recommended controls; recommended policies; conclusion | All seven sections are present in the single report | Complete |
| Single-report rule | All deliverables presented in one report; each group member submits the same group-produced report | One 16-page submission-authoritative DOCX and matching PDF contain the complete required sections and appendices | Complete; each of the nine members should submit the same group file |

## 2. Five-finding traceability summary

| Finding | Primary evidence basis | Confirmed observation | Explicitly not claimed |
|---|---|---|---|
| F-01 — Wildcard writable NFS root export, `no_root_squash` | Read-only export enumeration and target configuration record; Appendix A.1 | Wildcard client, read/write and no-root-squash configuration | No remote mount, remote file write or filesystem modification |
| F-02 — Anonymous SMB enumeration | Anonymous share enumeration and read-only directory listing; Appendix A.2 | Anonymous enumeration and directory metadata | No file-content access or write access |
| F-03 — Mutillidae configuration resource over HTTP | Benign HEAD validation; Appendix A.3 | HTTP 200 and `text/plain` for the configuration resource | No response body retrieval or secret/database access |
| F-04 — Public default credential disclosure | 8 November service-configuration validation record and recovered landing-page screenshot; Appendix A.4 | Credential pair was displayed on the public HTTP landing page | No login, credential validity, reuse or privilege test |
| F-05 — Telnet and Berkeley r-services | Listener and service-exposure review; Appendix A.5 | Telnet and r-services listeners on all IPv4 interfaces | No login, interception, trust evaluation or remote command |

## 3. Scope and scoring qualifications

- The assessment target was Metasploitable 2 at 192.168.138.20 on the isolated `CAPSTONE138_ISOLATED` virtual network; Kali Linux at 192.168.138.10 was the assessment workstation.
- The report does not claim that a separate HanTech production network or live cloud tenant was tested.
- No exploitation, brute force, credential submission, NFS mount, SMB content access, database access or target mutation is claimed.
- The 5×5 likelihood × impact score is a contextual project risk estimate. It is not CVSS and is not an approved production risk acceptance.
- CVE/CVSS is addressed per finding. No direct CVE match was sufficiently established for the five selected observations, so no unsupported numeric CVSS score is presented.
- The report includes evidence appendices to substantiate the required report sections; they do not create additional assignment tasks.

## 4. Final verification

The Word and PDF reports are submission-authoritative files dated 18 November 2026 and each contains 16 pages when rendered as the final A4 PDF. The executive summary is one page. The final QA record is:

`10_Final_Report/FINAL_REPORT_SUBMISSION_QA_20261118.md`

The SHA-256 values for final submission artefacts are:

`10_Final_Report/FINAL_REPORT_FILE_HASHES_20261118.sha256`

**Assessment:** All express section and content requirements in the uploaded official brief are represented in the single report. The CVE/CVSS qualification above is disclosed rather than masked: no unsupported CVE/CVSS match is manufactured for configuration-level findings.
