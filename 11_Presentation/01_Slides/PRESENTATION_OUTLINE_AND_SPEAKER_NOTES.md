# Capstone Presentation Outline and Speaker Notes
**Project:** From Vulnerability to Compliance — Securing Legacy and Cloud Systems at HanTech  
**Audience:** TS Academy assessors / management scenario  
**Status:** DRAFT OUTLINE — final deck and rehearsal not completed

## Slide 1 — Title and team
Project title, programme, team members and submission date. Identify the work as a controlled evidence-led security assessment.

**Speaker note:** Explain that the team assessed the specifically named Metasploitable 2 training target and used its evidence to model risk and control recommendations for HanTech.

## Slide 2 — Scope, authorisation and limits
- Target: Metasploitable 2 at 192.168.138.20.
- Scanner: Kali at 192.168.138.10.
- Isolated VirtualBox Internal Network CAPSTONE138_ISOLATED.
- Dev Guru / second system remains out of scope pending instructor clarification.
- No exploitation or destructive test.

**Speaker note:** Emphasise that the Internal Network is guest-only and is not a host-only network. The assessment did not touch production assets.

## Slide 3 — Method and environment
- Network readiness: bidirectional ping passed after the approved DHCP correction.
- Nmap 7.98 full TCP connect/version-light scan, ports 1–65535: 30 open / 65,505 closed.
- Targeted TCP recheck independently reconfirmed seven additional service/port leads.
- UDP top-100: 4 confirmed open, 3 open|filtered/no-response, 93 closed; not full UDP coverage.
- Read-only local configuration and service-specific review.

**Speaker note:** Explain what the scan did and did not cover. An open port or banner is an inventory observation, not a confirmed vulnerability.

## Slide 4 — Service inventory and attack surface
Group services into web/application, file sharing, remote administration, database, messaging and infrastructure services. Show the 30-port TCP inventory and the separately scoped UDP top-100 results in the appendix.

**Speaker note:** Highlight NFS, SMB, HTTP, Telnet/r-services, FTP, Tomcat/AJP and IRC as the main follow-up areas.

## Slide 5 — Five priority findings
1. NFS root export to wildcard clients with rw/no_root_squash.
2. Anonymous SMB share enumeration and tmp metadata.
3. Mutillidae config resource exposed over HTTP as text/plain.
4. Public default credential pair on HTTP landing page.
5. Telnet and Berkeley r-services listeners exposed on all IPv4 interfaces.

**Speaker note:** For each, separate confirmed configuration/exposure from impact that was not tested.

## Slide 6 — Additional CVE and legacy software leads
- Samba CVE-2007-2447: high-confidence candidate, patch provenance unresolved.
- Apache/PHP lifecycle and package revision leads.
- WebDAV and Tomcat/AJP exposure.
- ProFTPD and UnrealIRCd leads.
- vsftpd CVE-2011-2523 excluded on current evidence.

**Speaker note:** Demonstrate professional restraint: no CVE is assigned from version banners alone; vendor backports and prerequisites matter.

## Slide 7 — Risk prioritisation
Present the likelihood × impact method and provisional scores: F-01 20 Critical; F-02 8 Moderate; F-03 16 High; F-04 16 High; F-05 12 High. Put the NFS export at the top; note that scores follow the allocated owner's working model and remain subject to Abundance's approval, HanTech business context, network reachability and compensating controls.

**Speaker note:** Clarify that the risk score is not CVSS, and that critical potential impact does not mean compromise was observed.

## Slide 8 — Security control recommendations
- Remove root NFS export and restrict clients.
- Restrict SMB guest access.
- Remove web-accessible config and secrets.
- Remove default credentials and enforce MFA.
- Disable Telnet/r-services and restrict SSH.
- Modernise unsupported software.

**Speaker note:** Map preventive, detective and corrective controls to each finding; identify how evidence will prove remediation.

## Slide 9 — GRC and compliance
- Draft policies: vulnerability/patch; identity/credential; network/remote access; data/application/secrets; logging/incident response/recovery.
- NDPA 2023 as the Nigerian privacy baseline where it applies.
- GDPR, HIPAA and PCI DSS conditional on territorial, business-role and data-flow tests.
- NIST CSF 2.0 and CIS Controls v8.1 as management/control-alignment references.

**Speaker note:** Do not describe every framework as automatically applicable to HanTech.

## Slide 10 — Cloud security
- Shared responsibility across IaaS/PaaS/SaaS.
- IAM, MFA, least privilege, network segmentation, encryption, logs, backups and secure delivery.
- No live cloud tenant review was possible because no provider/account/authorised scope was supplied.
- Task 7 owner/volunteer still pending.

**Speaker note:** Describe the cloud deliverable as a desk-based baseline and evidence plan, not a live assessment.

## Slide 11 — Roadmap and ownership
Immediate: NFS, exposed web configuration, default credentials, legacy remote access.  
Short-term: SMB restrictions, logging and access reviews.  
Strategic: supported platform migration, cloud governance, continuous vulnerability management and policy implementation.

**Speaker note:** Name the responsible workstream owners and record any unassigned work rather than implying completion.

## Slide 12 — Conclusion, evidence and questions
- Findings and limitations.
- Evidence register and SHA-256 manifest.
- Scope question and cloud owner dependency.
- Management decisions requested.

**Speaker note:** Close with the principle that every claim in the report is traceable to retained evidence and every untested impact remains labelled as not tested.

## Visual/evidence checklist for the final deck
- Use screenshots that show the command/result and target identity where possible.
- Redact personal data, credentials, tokens and unrelated desktop content.
- Do not show any secret value from Mutillidae config.
- Include one compact network topology diagram and one risk chart only after the final owners accept the data.
- Use the final report's actual risk scores and evidence IDs; do not copy provisional figures after they change.
