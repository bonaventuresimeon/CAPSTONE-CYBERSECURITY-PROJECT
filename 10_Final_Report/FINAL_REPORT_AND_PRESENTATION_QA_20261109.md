# CAPSTONE PROJECT 138 â€” Final Report and Presentation QA Record
**Updated:** 9 November 2026 (Africa/Lagos)

## 1. Integrated content checks
- [x] Integrated final report master saved: `10_Final_Report/FINAL_REPORT_20261109.md` (405 lines).
- [x] Editable Word-compatible report created: `10_Final_Report/FINAL_REPORT_20261109.docx`.
- [x] 14-slide presentation and speaker notes saved as Markdown.
- [x] Editable Word-compatible presentation-script copy created: `11_Presentation/FINAL_PRESENTATION_AND_SPEAKER_NOTES_20261109.docx`.
- [x] Team allocation and workstream completion register retained.
- [x] Five-finding reconciliation report and machine-readable crosswalk retained.
- [x] Risk assessment, security controls, GRC policy drafts and cloud baseline included and retained as standalone workstream artefacts.
- [x] Full TCP, targeted TCP and UDP top-100 scope limits are distinguished.
- [x] Five canonical finding IDs and qualitative risk bands are internally consistent.
- [x] CVE candidates are not presented as confirmed exploitation.
- [x] No instructor approval or fabricated second target is included.
- [x] Allocation names are presented as allocation labels, not personal signatures or personal attestations.
- [x] Task 7 is labelled desk-based only; no live cloud assessment is claimed.
- [x] Lab observations are not attributed to HanTech production.
- [x] Untested impact, remediation implementation and formal policy adoption are not represented as completed.

## 2. Evidence and folder classification checks
- [x] Full TCP native outputs, receipt and original scan screenshots reside in `09_Evidence/02_System_Discovery/01_Full_TCP_Discovery_20261108`.
- [x] Targeted TCP native outputs and 9 November Nmap screenshots reside in `09_Evidence/02_System_Discovery/02_Targeted_TCP_Recheck_20261109`.
- [x] UDP top-100 native outputs, receipt and 9 November screenshots reside in `09_Evidence/02_System_Discovery/03_UDP_Top100_20261109`.
- [x] Lab/network/console evidence is held under `09_Evidence/01_Network_Configuration`.
- [x] Vulnerability-specific research and read-only validation evidence is held under `09_Evidence/03_Vulnerability_Assessment`.
- [x] Discovery-only native Nmap outputs and TCP scan screenshots were removed from the vulnerability packet; recursive check found no `.nmap`, `.gnmap`, `.xml` or full-scan screenshot names in the vulnerability evidence packet.
- [x] Risk evidence packet contains only its dedicated risk-basis record; no discovery or vulnerability screenshot copies remain.
- [x] Empty security-controls evidence packet was removed because no control implementation evidence exists; the control design remains in `06_Security_Controls`.
- [x] Active manifests, sidecar, hash receipts, transfer provenance and audit logs are grouped under `09_Evidence/06_Integrity_and_Transfer`.
- [x] 57 byte-identical duplicate copies were removed only after SHA-256 equality was checked against retained canonical evidence.
- [x] A different Metasploitable console screenshot was preserved with a conflict-qualified filename, not overwritten.
- [x] The four initially unclassified files were subsequently moved to network configuration or vulnerability research according to their evidentiary role.

## 3. Native document and presentation generation

A new report DOCX was generated from the corrected Markdown master as `10_Final_Report/FINAL_REPORT_PROFESSIONAL_20261109.docx`. The generation validation receipt records 450 DOCX paragraphs and 11 native Word tables. A separate outline inspection previously reported 181 paragraph entries; these represent different inspection methods/counting units and should not be treated as contradictory document-size measurements. The first-page scope label explicitly identifies Metasploitable 2 as HanTech's designated capstone assessment environment. The DOCX is structurally generated, but visual page-by-page inspection remains pending.

A genuine PowerPoint file was generated as `11_Presentation/FINAL_PRESENTATION_PROFESSIONAL_20261109.pptx`. Open XML package inspection confirms 14 slide XML parts, 14 notes-slide parts and text content on all 14 slides. This confirms package structure and notes presence, not visual slide quality or speaker-note editorial completeness. PowerPoint GUI rendering and slide-by-slide inspection remain pending.

A PDF was generated from the report Markdown using a Chromium-based HTML print route as `10_Final_Report/FINAL_REPORT_PROFESSIONAL_20261109.pdf`. The PDF reader extracted 14 pages and the report content, including all five findings, tables and appendices. The PDF text extraction shows table content is present, but it does not establish the visual fit of every column or page break. A visual PDF review remains outstanding.

The host does not expose registered Word.Application or PowerPoint.Application COM automation, and standard executable-path checks did not locate desktop Word/PowerPoint. Chrome and Edge browsers are present. No claim is made that Microsoft Word or PowerPoint was launched. The Markdown masters remain the content-authoritative sources until the generated Office files pass visual review.

## 4. Known limitations
- Only Metasploitable 2 is identified as an authorised target.
- UDP coverage is top-100 only; three responses are open|filtered/no-response.
- Four high TCP ports remain unidentified.
- Samba CVE-2007-2447 patch provenance remains unresolved.
- No HanTech production context, authorised second target or live cloud tenant was supplied.
- No production remediation, policy adoption, control implementation or owner sign-off is claimed.
- The prior current-status file was inadvertently removed during a same-path duplicate-handler operation; a concise current status snapshot was reconstructed from retained artefacts and the incident is recorded in the folder-action CSV. It is not claimed as a byte-for-byte recovery.

## 5. QA decision
**CONTENT QA: PASS WITH EXPLICIT SCOPE LIMITATIONS.**  
**EVIDENCE CLASSIFICATION: PASS WITH DOCUMENTED REORGANISATION AUDIT.**  
**REPORT DOCX: GENERATED; 11 NATIVE TABLES; STRUCTURAL CHECK PASS; VISUAL REVIEW PENDING.**  
**REPORT PDF: GENERATED; 14 PAGES; CONTENT EXTRACTION PASS; VISUAL REVIEW PENDING.**  
**PRESENTATION PPTX: GENERATED; 14 SLIDES AND 14 NOTES-SLIDE PARTS; STRUCTURAL CHECK PASS; VISUAL REVIEW PENDING.**  
**OFFICIAL INSTITUTIONAL RUBRIC: NOT LOCATED; REQUIREMENT MAPPING REMAINS PROVISIONAL.**  
**INTEGRITY: LATEST RECURSIVE MANIFEST REFRESH AND INDEPENDENT REHASH RECORDED IN `09_Evidence/06_Integrity_and_Transfer/01_Manifests/MANIFEST_VERIFICATION_RECEIPT_20261109.txt`; any subsequent file edits require another refresh.**
