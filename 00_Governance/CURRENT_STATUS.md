# CAPSTONE PROJECT 138 — Current Status

**Status date:** 18 November 2026 (Africa/Lagos)  
**Project:** From Vulnerability to Compliance: Securing Legacy and Cloud Systems at HanTech  
**Programme:** TS Academy Cybersecurity Capstone  
**Group:** 138 — nine named teammates  
**Submission deadline in the official brief:** 21 November 2026  
**Current position:** FINAL WORD/PDF REPORT PREPARED LOCALLY AND QA-REVIEWED; GOVERNANCE AND REQUIREMENT DOCUMENTATION PUSHED TO REPOSITORY; BINARY REPORT/BRIEF UPLOAD STILL PENDING. NOT YET SUBMITTED.

## 1. Authoritative assignment source

The four-page TS Academy assignment brief was supplied as a conversation attachment and reviewed directly. A repository copy of the source PDF has not yet been uploaded.

The final compliance mapping is:

`00_Governance/ASSESSMENT_REQUIREMENT_TO_EVIDENCE_MATRIX_20261118.md`

The brief requires five Metasploitable 2 findings; risk assessment; at least one control per finding; at least four GRC policies; the listed cloud-security fundamentals; a one-page non-technical executive summary; and a single professional report containing the specified sections.

## 2. Technical scope and evidence boundary

- Assessment source: Kali Linux, 192.168.138.10/24.
- Designated assessment target: Metasploitable 2, 192.168.138.20/24.
- Network: VirtualBox Internal Network `CAPSTONE138_ISOLATED`.
- The technical assessment was confined to the isolated training environment.
- No live HanTech production system or cloud tenant was tested.
- No exploitation, brute force, credential submission, NFS mount, SMB file-content access, database access, state-changing HTTP request or destructive test was performed.
- The project archive supplied the consolidated workstream artefacts, raw validation records, screenshots, risk records and evidence crosswalk. The final report uses only the five reconciled priority findings.

## 3. Five selected findings and contextual risk position

| ID | Finding | Likelihood | Impact | Score | Rating |
|---|---|---:|---:|---:|---|
| F-01 | Wildcard writable NFS root export with `no_root_squash` | 4 | 5 | 20/25 | Critical |
| F-02 | Anonymous SMB share enumeration and directory metadata disclosure | 4 | 2 | 8/25 | Medium |
| F-03 | Mutillidae configuration resource reachable over HTTP as `text/plain` | 4 | 4 | 16/25 | High |
| F-04 | Default laboratory credential pair displayed on public HTTP landing page | 4 | 4 | 16/25 | High |
| F-05 | Telnet and Berkeley r-services listening on all IPv4 interfaces | 3 | 4 | 12/25 | High |

The ratings use a qualitative 5×5 likelihood × impact model. They are contextual project risk estimates, not CVSS scores or approved HanTech production risk acceptance. No CVE/CVSS score has been invented or copied from an unrelated service candidate. The final report records the CVE/CVSS applicability outcome for each selected finding.

## 4. F-04 evidence resolution

The consolidated evidence register identifies the 8 November landing-page screenshot and the companion `CAPSTONE138_SERVICE_CONFIGURATION_VALIDATION_20261108.txt` record. F-04 is supported by the screenshot shown in the report's Appendix A.4.

- Original screenshot SHA-256: `76f014c81f3ba826b781b38290d650b2d4b6a4bca41e8a6ad62785294c27a949`.
- Redacted derivative SHA-256: `56ea612688219d9274cb075874e53c1d5b4d9caa78a990a7a8cedfcbedb0578d`.
- The report and repository submission assets use the redacted derivative.
- The original technical evidence remains separately preserved in the evidence archive.
- The observation proves public disclosure, not successful authentication, credential reuse or privilege.

## 5. Official task completion mapping

- **Task 1 — Vulnerability Identification:** five findings; each includes vulnerability name, affected service, description and potential attacker goal.
- **Task 2 — Risk Assessment:** likelihood, impact, risk rating and rationale for each finding; CVE/CVSS applicability is addressed without unsupported attribution.
- **Task 3 — Security Control Recommendations:** controls mapped to all five findings, with explanations of risk reduction.
- **Task 4 — GRC Policy Recommendations:** five policy areas, each with purpose and findings mitigated.
- **Task 5 — Cloud Security Basics:** shared responsibility, IAM authentication/authorization/auditing, MFA, least privilege, common threats, best practices and conditional compliance frameworks/laws.
- **Executive Summary (also labelled Task 5 in the brief):** one-page, non-technical leadership summary covering all requested elements.
- **Required report sections:** title page, executive summary, vulnerability findings, risk assessment, recommended controls, recommended policies and conclusion.

See the 18 November requirement-to-evidence matrix and QA record for the detailed checks. The optional project presentation is retained separately; it is not substituted for or treated as a required section of the official single-report deliverable.

## 6. Final report and repository deliverables

- Intended repository path (binary upload pending): `10_Final_Report/PROJECT_138_FINAL_REPORT_20261118.docx` — editable Word report.
- Intended repository path (binary upload pending): `10_Final_Report/PROJECT_138_FINAL_REPORT_20261118.pdf` — matching 16-page A4 PDF.
- `10_Final_Report/FINAL_REPORT_SUBMISSION_QA_20261118.md` — official-brief compliance and visual QA record.
- `10_Final_Report/DOCUMENT_GENERATION_VALIDATION_20261118.txt` — file metadata and generation checks.
- `10_Final_Report/FINAL_REPORT_FILE_HASHES_20261118.sha256` — SHA-256 hashes of local submission artefacts.
- `04_Vulnerability_Assessment/FINDING_EVIDENCE_RISK_CROSSWALK_20261118.csv` — refreshed five-finding evidence map.
- `04_Vulnerability_Assessment/CVE_APPLICABILITY_MATRIX_20261118.csv` — current and separate candidate CVE mapping.
- `00_Governance/FINAL_REPORT_RELEASE_LOG_20261118.md` — release changes and publication boundary.
- The redacted F-04 derivative is embedded in the locally verified Word/PDF; standalone PNG upload is pending.
- The official assignment brief PDF was used as an uploaded source attachment; a repository copy is pending.

The report files are prepared locally and their hashes are recorded. The repository currently contains the governance and QA documentation, but the DOCX/PDF binaries and the official brief PDF have not yet been uploaded. No submission-form transaction or instructor acceptance is claimed.

## 7. Integrity and versioning

The 9 November recursive source-evidence manifest remains a historical integrity record for the evidence tree at its recorded refresh. The new report files and final-report asset have their own 18 November SHA-256 receipt; the old evidence manifest is not represented as covering those additions. The repository commit records the corresponding version change.

Earlier 9 November report-generation and QA records remain in the repository as historical records. The updated 18 November crosswalk is authoritative for the current five findings; the 9 November crosswalk and CVE research files remain preserved as historical snapshots. The 18 November Word/PDF package and its QA/validation records are the submission-authoritative versions.

## 8. Remaining qualifications

1. No directly applicable CVE was established for the five selected observations as evidenced; CVSS values are therefore not fabricated. The report distinguishes CVSS technical severity from the separate contextual risk model.
2. Risk scores remain provisional until HanTech asset criticality, data classification, architecture, business dependencies and compensating controls are known.
3. The cloud assessment is desk-based because no provider, tenant, workload or live-test authorisation was supplied.
4. The report has not been submitted to TS Academy; the team must complete the submission step before the 21 November 2026 deadline.
