# Final Report Release Log — 18 November 2026

## Release state
The Group 138 final report has been generated locally as an editable Word document and a matching 16-page A4 PDF. Both passed the recorded structural checks and visual review. The actual DOCX/PDF binary objects are **not yet present in GitHub**; the repository currently contains the documentation, QA, requirement mapping and source evidence. Their local SHA-256 values are recorded in `10_Final_Report/FINAL_REPORT_FILE_HASHES_20261118.sha256`. No placeholder files or broken download links have been created.

## Current repository documentation
- Official assignment requirement mapping: `00_Governance/ASSESSMENT_REQUIREMENT_TO_EVIDENCE_MATRIX_20261118.md`.
- Submission QA: `10_Final_Report/FINAL_REPORT_SUBMISSION_QA_20261118.md`.
- Generation validation and local report hashes: `10_Final_Report/DOCUMENT_GENERATION_VALIDATION_20261118.txt` and `10_Final_Report/FINAL_REPORT_FILE_HASHES_20261118.sha256`.
- Current finding evidence crosswalk: `04_Vulnerability_Assessment/FINDING_EVIDENCE_RISK_CROSSWALK_20261118.csv`.
- Current CVE applicability matrix: `04_Vulnerability_Assessment/CVE_APPLICABILITY_MATRIX_20261118.csv`.
- The 9 November crosswalk and matrices remain unchanged as historical records.

## Changes reflected by this release
1. Official four-page TS Academy assignment brief reviewed and mapped requirement-by-requirement.
2. Five selected findings retained, with finding IDs, evidence and contextual 5×5 risk scores reconciled.
3. F-04 screenshot recovered from the evidence archive; original remains preserved in the source-evidence tree; report displays a redacted derivative.
4. Current CVE matrix distinguishes the five selected findings from the separate Samba CVE-2007-2447 candidate and other service leads.
5. Risk ratings use Low / Medium / High / Critical; F-02 score 8/25 is Medium.
6. QA and status records explicitly state that production testing, live cloud testing, exploitation, successful credential use, control implementation and formal policy adoption are not claimed.

## Binary upload limitation
The connected GitHub interface permits repository reads and Git object/text updates but does not expose a way to stream the current local DOCX/PDF attachments as binary content. The authorised Desktop Commander device was offline during this update. The final report binaries are therefore not represented as pushed. The original F-04 screenshot and validation receipt were already present in the repository and remain unchanged.

## Submission boundary
This is a prepared group report package, not a submission transaction. Each of the nine group members should submit the same group-produced report through the Academy's prescribed form. No instructor approval or grade is claimed.


## Uploaded source-file receipt — verified in conversation workspace

On 18 November 2026 the following files were accessible as actual files in the
conversation workspace and verified locally:

| File | Size | Verification |
|---|---:|---|
| `Project_138_Final_Report.docx` | 871,862 bytes | DOCX ZIP integrity test passed; SHA-256 matches the release hash receipt |
| `Project_138_Final_Report.pdf` | 620,683 bytes | 16 pages, A4, unencrypted; SHA-256 matches the release hash receipt |
| `TSACADEMY CAPSTONE PROJECT 138.pdf` | 83,860 bytes | Four pages, unencrypted; SHA-256 recorded in the hash receipt |
| `KALI_HTTP_ROOT_APP_INDEX_20261108_REDACTED.png` | 338,047 bytes | SHA-256 matches the report's embedded F-04 exhibit |

The PDF was rendered to 16 images. The cover, one-page executive summary and final
appendix page were visually inspected; no page-count mismatch or obvious clipping was
observed in those pages. The DOCX package passed ZIP integrity validation and includes
five embedded media assets.

## GitHub binary-upload status

The source files are available and verified locally, but the connected GitHub toolset
for this session exposes text-file and Git-object writes only; it does not expose a
binary upload operation or accept a local file path for blob content. The connected
Desktop Commander device `Phamous` is offline. Accordingly, the DOCX/PDF, original
brief PDF and standalone exhibit PNG are **not yet committed as binary files**. The
repository tree was checked after the latest commit and these exact paths are absent.
No fake binary placeholders were committed.

This is a transfer-capability limitation, not a missing-source-file issue. The report
and brief remain available from the conversation attachments/local download links.
