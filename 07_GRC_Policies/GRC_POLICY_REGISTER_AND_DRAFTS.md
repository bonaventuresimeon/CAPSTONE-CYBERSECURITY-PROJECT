# Governance, Risk and Compliance — Policy Register and Draft Requirements
**Project:** HanTech — From Vulnerability to Compliance  
**Date:** 8 November 2026  
**Allocated owner:** Amos Talks — Task 6, GRC Policies  
**Status:** PROJECT GRC DELIVERABLE COMPLETE — policy adoption/management approval not evidenced

## 1. Purpose and governance position
This register translates the lab observations into organisational policy requirements for the fictional HanTech case study. The policies are drafts and are not evidence that HanTech has formally adopted or implemented them. The final report should identify an accountable policy owner, approval authority, review cycle, exception process and evidence of operation for each policy.

The proposed governance model uses the NIST Cybersecurity Framework (CSF) 2.0 functions: GOVERN, IDENTIFY, PROTECT, DETECT, RESPOND and RECOVER. CIS Critical Security Controls v8.1 may be used as a prioritised safeguard reference. Legal obligations are conditional on HanTech's actual processing, geography, business model and contracts.

## 2. Policy register
| Policy ID | Policy title | Accountable owner (proposed) | Review cadence | Primary findings addressed |
|---|---|---|---|---|
| POL-01 | Vulnerability, Patch and Secure Configuration Management | Head of IT / Security Lead | Quarterly and after critical incidents | F-01 to F-05; unsupported software and all CVE leads |
| POL-02 | Identity, Authentication and Credential Management | Head of IT / IAM Owner | Quarterly; privileged access monthly | F-03, F-04, F-05; SMB and remote-access controls |
| POL-03 | Network Security and Remote Access | Network Security Lead | Quarterly and after network changes | F-01, F-02, F-05; WebDAV, AJP and legacy service exposures |
| POL-04 | Data Classification, Secure Application Configuration and Secrets | Data Protection Officer / Application Security Owner | Annual and after significant application change | F-03, F-04; WebDAV and web-application risks |
| POL-05 | Security Logging, Incident Response and Recovery | Security Operations / IT Service Owner | At least annually; exercise at least annually | F-01 to F-05; detection, investigation and recovery |

## 3. Draft policy requirements

### POL-01 — Vulnerability, Patch and Secure Configuration Management
**Purpose:** ensure assets, services, software and configuration weaknesses are identified, prioritised, remediated and independently verified.

**Mandatory requirements**
1. Maintain an inventory of hardware, VMs, cloud services, applications, owners, versions and exposure.
2. Use approved secure configuration baselines; disable unused services and default/demo applications.
3. Review vendor security notices and supported-version status at least monthly.
4. Conduct authenticated vulnerability assessment only within approved scope and with documented rules of engagement.
5. Prioritise remediation using likelihood, impact, exploit conditions, asset criticality and exposure; keep CVSS separate from business risk.
6. Define remediation SLAs by severity. Suggested starting targets: Critical 7 calendar days, High 30 days, Medium 60 days and Low 90 days, subject to management approval and operational context.
7. Require change approval, rollback plan, testing, evidence capture and post-change validation.
8. Record accepted risks with accountable owner, compensating controls, expiry date and approval.

**Evidence of operation:** asset inventory, vulnerability register, vendor advisory reviews, patch reports, approved change records, exceptions and retest evidence.

**Findings mapping:** unsupported Apache/PHP and other legacy components; F-01 to F-05 where hardening or patching applies.

### POL-02 — Identity, Authentication and Credential Management
**Purpose:** prevent unauthorised access and reduce credential misuse.

**Mandatory requirements**
1. Give each workforce member a unique identity; prohibit shared named-user accounts except approved service accounts.
2. Require MFA for privileged access, remote access, cloud console access, email and other high-impact systems. Prefer phishing-resistant authenticators where supported.
3. Remove vendor/demo/default accounts or change their credentials before production exposure.
4. Store credentials, API keys and database secrets in an approved secrets manager; do not place them in public pages, source repositories, images or documents.
5. Use least privilege, role-based access and just-in-time elevation for privileged tasks.
6. Disable accounts promptly on role change or departure; review privileged and service-account access at least quarterly.
7. Rotate credentials after suspected disclosure, personnel change or incident; keep a record of the rotation and affected dependencies.
8. Review authentication logs and alert on repeated failures, unexpected geography/device, privileged activity and use of dormant identities.

**Evidence of operation:** IAM access review, MFA coverage, account lifecycle tickets, secrets-vault inventory, credential rotation evidence and authentication alerts.

**Findings mapping:** F-03 and F-04; F-02 where guest SMB access is identity-related; F-05 for strong remote authentication.

### POL-03 — Network Security and Remote Access
**Purpose:** limit services and connections to approved users, systems and network zones.

**Mandatory requirements**
1. Maintain an approved network diagram and segmentation matrix for production, management, user, development, backup and cloud networks.
2. Deny inbound access by default; document business justification and owner for every permitted service path.
3. Export NFS data only to named authorised clients; prohibit root filesystem exports and no_root_squash except a formally approved and exceptional requirement.
4. Disable Telnet, rsh, rlogin, rexec and other obsolete remote-administration protocols.
5. Permit administrative access through hardened SSH or approved remote-access gateways, with MFA and central logging.
6. Restrict SMB, NFS, RMI, database, AJP, management and WebDAV endpoints to required source networks and service identities.
7. Review firewall rules and exposed ports at least quarterly and after major architecture changes.
8. Monitor network configuration changes and investigate unexpected listeners.

**Evidence of operation:** approved network diagrams, firewall/rule exports, service inventories, periodic port reviews, remote-access logs and exception approvals.

**Findings mapping:** F-01, F-02 and F-05; WebDAV and Tomcat/AJP exposures.

### POL-04 — Data Classification, Secure Application Configuration and Secrets
**Purpose:** prevent sensitive data and configuration from being exposed through applications, file permissions or insecure deployment.

**Mandatory requirements**
1. Classify data as Public, Internal, Confidential or Restricted and assign a data owner.
2. Identify personal data, payment data, credentials, authentication tokens, database configuration and regulated information before deployment.
3. Keep configuration and secrets outside publicly served directories; enforce deny rules for sensitive file extensions and paths.
4. Apply least-privilege file and directory permissions; prohibit world-writable application configuration or upload directories unless a documented design requires it.
5. Apply secure development review, dependency inventory, code review, secret scanning and security testing before deployment.
6. Require secure headers, input/output handling, authentication and access control; verify web controls against a recognised standard such as OWASP ASVS.
7. Encrypt sensitive data in transit and at rest; manage and rotate keys under an approved key-management process.
8. Set retention, deletion, backup and breach-handling requirements according to data category and law.

**Evidence of operation:** data inventory/classification, application threat model, secure configuration review, secret scan output, web-server access rules, permissions checks and deployment approvals.

**Findings mapping:** F-03 and F-04; WebDAV and legacy application risks.

### POL-05 — Security Logging, Incident Response and Recovery
**Purpose:** detect, contain, investigate and recover from security incidents while preserving reliable evidence.

**Mandatory requirements**
1. Centralise security logs from identity, endpoint, server, network, application, database and cloud sources.
2. Synchronise time sources and protect log integrity, retention and access.
3. Alert on anonymous SMB access, unexpected NFS access, exposed configuration paths, default-account use, new listeners, privilege escalation indicators and anomalous remote administration.
4. Maintain an incident response plan defining triage, escalation, containment, evidence preservation, legal/privacy notification review and recovery.
5. Preserve raw logs, timestamps, hashes, command context and chain-of-custody notes for relevant evidence.
6. Maintain encrypted, access-controlled backups with offline/immutable protection where appropriate.
7. Test restoration and recovery procedures at least annually and after material changes.
8. Conduct lessons-learned reviews and track corrective actions to closure.

**Evidence of operation:** log-source inventory, detection rules, incident tickets, exercise reports, backup logs, restore-test results and lessons-learned tracker.

**Findings mapping:** all priority findings; especially NFS, anonymous SMB, exposed web configuration and insecure remote services.

## 4. Legal and standards applicability register
| Framework | Applicability rule for HanTech | What must be established before claiming applicability |
|---|---|---|
| Nigeria Data Protection Act 2023 and applicable NDPC instruments | Relevant where HanTech acts as a data controller or processor and processes personal data within the Act's scope. | Data categories, processing purposes, controller/processor roles, data-subject locations, cross-border transfers, contracts and DPO/legal assessment. |
| GDPR | Relevant where processing occurs in the context of an EU establishment, or a non-EU organisation offers goods/services to people in the EU or monitors their behaviour there. | EU establishment, targeting/offer evidence or behavioural monitoring of people in the EU. |
| HIPAA | Applies to covered entities and business associates handling electronic protected health information (ePHI), not to every organisation or every health-related datum. | Covered-entity/business-associate role, ePHI processing, contracts and US healthcare transaction context. |
| PCI DSS v4.0.1 | Relevant to entities that store, process or transmit payment-card data, and systems that can affect the cardholder data environment. | Payment data flows, merchant/service-provider role, CDE boundaries, acquirer/payment-brand requirements and third-party relationships. |
| NIST CSF 2.0 / CIS Controls v8.1 | Risk-management and control-alignment references; not laws merely by being adopted in this report. | Management decision to adopt, applicable contractual/regulatory obligations and selected control profile. |

## 5. Governance and approval workflow
1. Policy owner drafts and maps the requirements to business processes.
2. IT, Security, Privacy/Legal, HR and relevant service owners review the draft.
3. Management or designated authority approves and publishes the controlled version.
4. Employees and suppliers receive required communication and training.
5. Control owners retain evidence of implementation and operation.
6. Policy exceptions require documented risk, compensating controls, expiry and accountable approval.
7. Policies are reviewed on the cadence above and after material incidents, regulatory changes or major architecture changes.

## 6. Evidence still required from HanTech
- Named policy approver, policy owners and escalation contacts.
- Current asset and data inventory.
- Business service criticality and network/cloud architecture.
- Employee/supplier IAM process and MFA coverage.
- Data processing records and privacy notices.
- Payment and healthcare data-flow decisions, if any.
- Contractual and jurisdictional obligations.
- Existing incident, backup and business continuity records.

## 7. Owner review
Task 6 is allocated to Amos Talks in the project task-allocation record. The five-policy register and conditional applicability analysis are complete as project deliverables. The name is an allocation label; no personal sign-off is claimed. These drafts are not formal adopted HanTech policies, and legal applicability remains conditional on actual data flows and organisational facts.

## 8. Authoritative references
- Nigeria Data Protection Act 2023: https://ndpc.gov.ng/wp-content/uploads/2024/03/Nigeria_Data_Protection_Act_2023.pdf  
- NDPC Annual Report 2025 (GAID 2025 commencement information): https://ndpc.gov.ng/wp-content/uploads/2026/02/Print_NDPC-Annual-Report-2025-1.pdf  
- GDPR Article 3, territorial scope: https://eur-lex.europa.eu/legal-content/EN/TXT/?qid=1496048922207&uri=CELEX%3A32016R0679  
- HHS HIPAA covered entities: https://www.hhs.gov/hipaa/for-professionals/covered-entities/index.html  
- HHS HIPAA Security Rule: https://www.hhs.gov/hipaa/for-professionals/security/laws-regulations/index.html  
- PCI SSC Document Library (PCI DSS v4.0.1): https://www.pcisecuritystandards.org/document_library/  
- NIST CSF 2.0: https://www.nist.gov/publications/nist-cybersecurity-framework-csf-20  
- CIS Controls v8.1: https://www.cisecurity.org/controls/v8-1  
- NIST SP 800-53 Rev. 5: https://csrc.nist.gov/pubs/sp/800/53/r5/upd1/final  
