# CAPSTONE PROJECT 138 — FINAL PRESENTATION
## From Vulnerability to Compliance: Securing Legacy and Cloud Systems
**Presentation script and speaker notes — 9 November 2026**

### Slide 1 — Title and team allocation
**On-slide**
- HanTech Capstone Project 138
- From Vulnerability to Compliance: Securing Legacy and Cloud Systems
- Evidence-led assessment of an isolated HanTech-designated Metasploitable 2 capstone assessment environment
- Task allocation: Jeffrey (1–2); Bonaventure (3 and 8); Abundance (4); Adeayo (5); Amos Talks (6); Task 7 desk-based baseline prepared

**Speaker notes**
Introduce the project as an evidence-led assessment linking technical weaknesses to risk, controls and governance. Names are the allocation labels recorded in the project task-allocation file, not signed personal attestations.

### Slide 2 — Objectives and scope
**On-slide**
- Establish isolated lab and authorised scope.
- Discover reachable services.
- Select five evidence-backed findings.
- Prioritise risk and recommend controls.
- Develop GRC and cloud-security baselines.
- Target: Metasploitable 2 — 192.168.138.20.
- Source: Kali Linux — 192.168.138.10.
- Network: CAPSTONE138_ISOLATED (VirtualBox Internal Network).

**Speaker notes**
Metasploitable 2 is the designated HanTech assessment environment for this capstone. The second system mentioned in earlier project materials was not identified in the authorised target scope, so no substitute system was scanned. The lab was isolated using VirtualBox Internal Network CAPSTONE138_ISOLATED and was not host-only or bridged networking. No instructor dependency is assumed.

### Slide 3 — Method and safety boundaries
**On-slide**
- Full TCP discovery and targeted TCP corroboration.
- UDP top-100 discovery.
- Read-only configuration review and benign HTTP HEAD request.
- Raw outputs, screenshots, receipts and SHA-256 evidence.
- No exploitation, brute force, credential submission, NFS mount, SMB content read, database query or target mutation.

**Speaker notes**
Service discovery is not a vulnerability scan. No state-changing or exploit activity was performed. Observed facts are separated from potential impact and untested conditions.

### Slide 4 — Discovery results
**On-slide**
- Full TCP: 65,535 scanned; 30 open; 65,505 closed.
- Targeted TCP recheck: 7/7 selected ports open.
- UDP top-100: 4 confirmed open; 3 open|filtered; 93 closed.
- UDP scope was top-100 only, not all UDP ports.
- Four high TCP ports remain unidentified.

**Speaker notes**
Targeted leads: distccd 3632, UnrealIRCd 6697, Ruby DRb 8787 and unknown high ports 33543, 47335, 47852 and 60679. The three ambiguous UDP ports received no response and must not be called confirmed open.

### Slide 5 — Five priority findings
**On-slide**
1. F-01: NFS root export to wildcard clients with rw/no_root_squash.
2. F-02: Anonymous SMB share enumeration and directory metadata.
3. F-03: Mutillidae configuration resource reachable over HTTP as text/plain.
4. F-04: Default lab credential pair disclosed on public HTTP page.
5. F-05: Telnet and Berkeley r-services exposed on all IPv4 interfaces.

**Speaker notes**
All five are supported by saved technical evidence. Do not imply that potential downstream impacts were exploited or demonstrated. For Mutillidae, only the HEAD response was obtained; the body and secret values were not retrieved.

### Slide 6 — CVE and service leads: careful classification
**On-slide**
- Samba CVE-2007-2447: high-confidence applicability candidate; binary patch provenance unresolved.
- Apache/PHP: lifecycle/package-review leads; no specific CVE confirmed.
- UnrealIRCd: version/provenance unresolved; no trigger sent.
- vsftpd CVE-2011-2523: not established from banner; package evidence marked not affected.
- ProFTPD, Tomcat/AJP, WebDAV and new TCP ports: leads/exposures only.

**Speaker notes**
Version banners do not establish vulnerability. Vendor backports, exact binary provenance and exploit prerequisites matter. No candidate has been upgraded to confirmed exploitation.

### Slide 7 — Risk prioritisation
**On-slide**
- 5×5 qualitative likelihood × impact model.
- F-01: 20 — Critical.
- F-02: 8 — Moderate.
- F-03: 16 — High.
- F-04: 16 — High.
- F-05: 12 — High.
- Scores are contextual lab estimates, not CVSS.

**Speaker notes**
The NFS configuration ranks first because a wildcard writable root export with root squashing disabled creates severe potential exposure if an untrusted client is accepted. Scores are conditional on unknown business context and untested impact; they are not HanTech production risk acceptance.

### Slide 8 — Technical remediation priorities
**On-slide**
- Remove wildcard writable NFS root export.
- Restrict SMB guest enumeration and share ACLs.
- Remove web-accessible configuration resources.
- Remove public default credential disclosure and rotate/disable defaults.
- Disable Telnet/r-services; use hardened SSH.
- Modernise unsupported software and remove unused services.

**Speaker notes**
Each recommendation requires an owner, approved change, configuration evidence, safe retest, monitoring evidence and residual-risk decision. The project did not apply changes to the target.

### Slide 9 — Security controls
**On-slide**
- Preventive: least privilege, segmentation, secure configuration, MFA and patching.
- Detective: service inventory, access logs, configuration drift and secret scanning.
- Corrective: disable unsafe services, rotate confirmed exposed secrets, restore trusted configuration.
- Closure: approved change + evidence + retest + monitoring + residual-risk record.

**Speaker notes**
The control matrix maps controls to all five findings and cross-cutting legacy software, WebDAV and AJP exposures. Recommendations are not represented as implemented controls.

### Slide 10 — GRC policy framework
**On-slide**
- POL-01 Vulnerability, Patch and Secure Configuration Management.
- POL-02 Identity, Authentication and Credential Management.
- POL-03 Network Security and Remote Access.
- POL-04 Data Classification, Secure Application Configuration and Secrets.
- POL-05 Security Logging, Incident Response and Recovery.
- NDPA 2023 and other laws/frameworks apply conditionally.

**Speaker notes**
The policies are proposed drafts for HanTech, not formally adopted policies. GDPR, HIPAA and PCI DSS are not assumed to apply without relevant territorial, business-role and data-flow facts. NIST CSF 2.0 and CIS Controls are alignment references, not laws.

### Slide 11 — Cloud security baseline
**On-slide**
- Shared responsibility differs across IaaS, PaaS and SaaS.
- IAM, MFA, least privilege and time-bound privilege.
- Private networking and restricted management paths.
- Encryption, key management and secret stores.
- Audit logs, detection, protected backups and restore tests.
- No provider, tenant or authorised cloud scope supplied: desk-based assessment only.

**Speaker notes**
Task 7 is completed as a cloud-security baseline and evidence plan. No live cloud tenant was supplied or probed. A live assessment requires written authorisation, provider/tenant identification, approved read-only identity and rules of engagement.

### Slide 12 — Roadmap and ownership
**On-slide**
- Immediate: NFS, HTTP configuration exposure, default credentials.
- High: Telnet/r-services.
- Medium: anonymous SMB access.
- Strategic: supported platform migration, logging, backup testing and policy implementation.
- Project task allocation: Jeffrey, Bonaventure, Abundance, Adeayo and Amos Talks.
- Operational HanTech remediation roles remain proposed pending actual organisation ownership.

**Speaker notes**
Distinguish project task owners from real HanTech production remediation owners. The task allocation is recorded in the project governance file; no false approvals or signatures are represented.

### Slide 13 — Limitations and conclusion
**On-slide**
- One authorised target assessed.
- UDP top-100 only.
- No exploit or state-changing test.
- Five confirmed configuration/exposure findings; CVE candidates kept separate.
- No production or live cloud assessment.
- Evidence retained and SHA-256 manifest checked.

**Speaker notes**
The project demonstrates a defensible path from service discovery to risk and compliance recommendations. Production risk requires actual HanTech architecture, data and control evidence. A manifest hash confirms file integrity, not the truth of every interpretation.

### Slide 14 — References and discussion
**On-slide**
- NIST CSF 2.0 and SP 800-30 Rev. 1.
- NIST SP 800-53 Rev. 5; CIS Controls v8.1.
- OWASP ASVS.
- Nigeria Data Protection Act 2023.
- Samba CVE-2007-2447 advisory and Linux exports(5).
- Official cloud shared-responsibility documentation.

**Speaker notes**
Refer to the final report's full reference list and evidence appendix. Invite questions about scope, evidence confidence, risk treatment and the distinction between a lab observation and production applicability.

## Presentation evidence cues
- Use the actual full TCP scan screenshot and receipt for Slide 4.
- Use the genuine UDP final-check screenshot and receipt for Slide 4.
- Use the genuine Mutillidae HTTP HEAD screenshot for Slide 5.
- Use service configuration and Telnet/r-services receipts for Slides 5–6.
- Do not show credential values, secret values, private tokens or unrelated desktop content.
- The evidence manifest and finding crosswalk are appendices, not substitutes for source screenshots.
