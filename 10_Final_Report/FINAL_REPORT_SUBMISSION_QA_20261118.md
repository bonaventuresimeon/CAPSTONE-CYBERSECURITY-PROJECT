# Project 138 — Final Submission QA Record

**QA date:** 18 November 2026 (Africa/Lagos)  
**Authoritative assignment source:** `01_Project_Brief_and_Scope/TS_ACADEMY_CAPSTONE_PROJECT_138_BRIEF.pdf`  
**Submission files:** `PROJECT_138_FINAL_REPORT_20261118.docx` and `PROJECT_138_FINAL_REPORT_20261118.pdf`  
**Report length:** 16 A4 pages in the PDF render.

## 1. Scope of this QA

The final Word/PDF report was checked against the actual four-page TS Academy assignment brief, the consolidated Project 138 evidence archive, canonical five-finding register, CVE applicability research, risk crosswalk, controls matrix, GRC register, cloud-security assessment and F-04 validation artefacts.

The uploaded brief requires a single professional report. It does not list a PowerPoint presentation as a required deliverable; the separate project presentation remains supporting project material and is not used to replace any report requirement.

## 2. Official assignment checklist

| Check | Verification result |
|---|---|
| Title page contains project title and Group 138 identifier | Pass |
| Nine teammate names included on the group title page | Pass |
| One-page executive summary written for non-technical leadership | Pass |
| Five Metasploitable 2 findings selected | Pass |
| Every finding includes name, affected service, description and potential attacker goal | Pass |
| Risk assessment covers likelihood, impact, rating and short rationale for every finding | Pass |
| CVE/CVSS applicability is addressed without misattributing unrelated CVEs | Pass with qualification below |
| At least one control is mapped to each finding and its risk-reduction effect explained | Pass |
| At least four GRC policies included | Pass — five policy areas |
| Each policy explains its purpose and findings mitigated | Pass |
| Shared responsibility explained | Pass |
| IAM authentication, authorization and auditing defined and applied | Pass |
| MFA rationale and enforcement locations covered | Pass |
| Least privilege explained and applied to users/services | Pass |
| All named cloud-threat examples covered, including insider threats and DDoS | Pass |
| Cloud best practices identified | Pass |
| Compliance laws/frameworks discussed conditionally | Pass |
| Conclusion included | Pass |
| Required sections assembled in one report | Pass |

The official brief labels the executive-summary item “Task 5” after using Task 5 for Cloud Security Basics. The report includes both cloud-security coverage and a separate one-page executive summary; neither is omitted.

## 3. Five-finding and evidence checks

- **F-01:** wildcard writable NFS root export with `no_root_squash`; export configuration confirmed; no NFS mount or remote write.
- **F-02:** anonymous SMB share enumeration and directory metadata; no file-content or write access test.
- **F-03:** Mutillidae configuration resource returned HTTP 200 and `text/plain` to a benign HEAD request; no response body retrieval.
- **F-04:** public landing-page disclosure supported by the recovered 8 November screenshot and companion service-configuration validation record; report appendix displays a redacted derivative. No credential submission, authentication, privilege or reuse test.
- **F-05:** Telnet and Berkeley r-services listeners confirmed; no login, interception, trust evaluation or remote command.

The report preserves the distinction between confirmed observation, potential attacker goal and untested impact.

## 4. Risk and CVE/CVSS qualification

The five contextual risk scores are:
- F-01: 20/25 — Critical.
- F-02: 8/25 — Medium.
- F-03: 16/25 — High.
- F-04: 16/25 — High.
- F-05: 12/25 — High.

The report defines the 5×5 likelihood and impact scales and the corresponding rating bands. These scores are organisational/contextual estimates, not CVSS values or production risk acceptance.

No specific CVE was established for the five selected configuration/exposure findings based on the retained evidence. The report says so explicitly and does not transfer CVEs or CVSS values from unrelated service/version candidates. This is the evidence-based treatment of CVE/CVSS for the selected findings; if the instructor interprets the brief as requiring a numeric CVSS score even where no CVE or fully validated vulnerability specification exists, that interpretation would require a separate scoring basis and should not be met by inventing identifiers or prerequisites.

## 5. F-04 provenance and redaction

- Source capture: `09_Evidence/03_Vulnerability_Assessment/01_Raw_Research_and_Validation/KALI_HTTP_ROOT_APP_INDEX_20261108.png`.
- Companion record: `CAPSTONE138_SERVICE_CONFIGURATION_VALIDATION_20261108.txt`.
- Report copy: `10_Final_Report/assets/KALI_HTTP_ROOT_APP_INDEX_20261108_REDACTED.png`.
- Original screenshot SHA-256: `76f014c81f3ba826b781b38290d650b2d4b6a4bca41e8a6ad62785294c27a949`.
- Redacted derivative SHA-256: `56ea612688219d9274cb075874e53c1d5b4d9caa78a990a7a8cedfcbedb0578d`.

The report masks the credential values while retaining enough page context to substantiate public disclosure. This evidence does not establish valid login or access to any linked service.

## 6. Document and render checks

- Editable Word report: present; DOCX package integrity checked; 180 paragraphs and 12 native tables.
- Final PDF: present; 16 pages; A4 page size; no encryption; text extraction and visual page review completed.
- Executive summary: one page, page 2 after the title page.
- Evidence appendices: five findings are supported by exhibits A.1–A.5; F-04 includes the recovered redacted image.
- The PDF corresponds to the 18 November final report, not the 9 November historical report.
- Final file digests are in `FINAL_REPORT_FILE_HASHES_20261118.sha256`.

## 7. Scope and disclosure limitations

- Only Metasploitable 2 in the isolated capstone environment was technically assessed.
- The report does not claim a live HanTech production assessment or live cloud-tenant assessment.
- The cloud section is a desk-based application of cloud-security fundamentals.
- Risk estimates are provisional pending actual HanTech business-impact, asset criticality, architecture, data classification and compensating-control context.
- Recommendations are designs; control implementation, formal policy adoption, management acceptance and risk treatment closure are not claimed.
- The final report has been prepared for the nine-member group; no personal signatures or individual attestations have been invented.

## 8. QA decision

**OFFICIAL BRIEF SECTION COVERAGE: PASS.**  
**FIVE-FINDING TRACEABILITY: PASS WITH EXPLICIT TESTING LIMITATIONS.**  
**DOCX/PDF PACKAGE: PASS — 16-PAGE A4 PDF AND EDITABLE WORD FILE.**  
**F-04 EVIDENCE: RECOVERED, RECONCILED AND REDACTED IN REPORT PRESENTATION.**  
**CVE/CVSS: ADDRESSED WITH NON-APPLICABILITY EXPLANATION; NO UNSUPPORTED SCORES.**  
**SUBMISSION STATE: PREPARED; GROUP SUBMISSION TO TS ACADEMY NOT YET CLAIMED.**
