# Cloud Security Assessment — Baseline and Evidence Plan
**Project:** HanTech — From Vulnerability to Compliance  
**Assessment date:** 8 November 2026  
**Task:** Task 7 — Cloud Security Assessment  
**Owner:** No named Task 7 assignee in the recorded allocation; desk-based project workstream completed  
**Status:** DESK-BASED CONTROL ASSESSMENT; NO LIVE CLOUD TENANT TESTING

## 1. Scope and explicit limitation
No cloud account, subscription, tenant, cloud-hosted application, architecture diagram or second authorised target has been supplied. The assignment brief refers to two systems but the visible target list identifies Metasploitable 2 only. Dev Guru and any cloud tenant remain out of scope until the instructor/project owner identifies and authorises the environment.

Accordingly, this document is a desk-based cloud-security baseline and evidence plan for the fictional HanTech organisation. It is not a live cloud configuration review, penetration test, compliance certification or assertion that HanTech uses AWS, Azure or Google Cloud.

## 2. Shared responsibility model
Security responsibilities vary by provider and service model. The cloud customer always retains responsibility for its data, identities, access decisions and configuration choices, while the provider's responsibilities increase as the service becomes more managed. The provider's official responsibility matrix and the exact service documentation must be checked for each workload.

| Service model | Provider usually manages | Customer must manage |
|---|---|---|
| IaaS | Physical facilities, hardware, network fabric, hypervisor and underlying cloud infrastructure | Guest OS, patching, virtual network rules, workloads, applications, IAM, data, encryption configuration, backups and monitoring |
| PaaS | Physical infrastructure, host OS, platform/runtime and managed service availability | Application code, data, application identity/permissions, secrets, service configuration, API exposure, logging and retention settings |
| SaaS | Infrastructure and application operation, platform maintenance and service availability | Data governance, user identities, roles, MFA, sharing/access policies, endpoint security, integrations, retention, audit review and secure tenant configuration |

These are general patterns only. A managed database, serverless service, container platform or identity provider can shift individual controls. Document responsibility at the specific service and setting level.

## 3. Cloud control baseline for HanTech
### 3.1 Identity and access management
- Use a central identity provider and federated sign-in where practical.
- Require MFA for all administrative and remote access; use phishing-resistant MFA for privileged roles where supported.
- Avoid shared administrator accounts and static long-lived credentials.
- Apply least privilege through role-based access, narrow custom roles and resource-level permissions.
- Separate production, development and test identities and tenants.
- Use just-in-time privileged elevation with time limits, approval and audit trail.
- Review human and service identities regularly; remove stale keys, accounts and access grants.
- Protect workload identities and managed service identities; avoid embedding secrets in code, images or CI/CD logs.

### 3.2 Network and workload security
- Use private subnets and private service endpoints for sensitive workloads where supported.
- Deny inbound access by default; restrict management ports to approved administrative paths.
- Segment production, development, data, backup and management planes.
- Use web application firewalls and API gateways where risk warrants them.
- Harden images and container base layers; use supported OS and application versions.
- Scan infrastructure-as-code, container images, dependencies and deployed assets before release.
- Apply secure configuration baselines and continuously detect drift.

### 3.3 Data protection and key management
- Inventory and classify personal, confidential, payment and other sensitive data.
- Encrypt data in transit and at rest using provider-supported controls.
- Use dedicated key-management services or hardware-backed key protection where appropriate.
- Separate key administrators from data users; control key rotation, recovery, revocation and access logs.
- Apply data-loss prevention, retention and secure deletion rules that match business and legal requirements.
- Review data residency, transfer mechanisms, subprocessors and third-party access.

### 3.4 Logging, detection and response
- Enable audit logging for identity, control-plane, network, storage, database and application events.
- Send logs to a separate protected account/project or central SIEM where feasible.
- Retain logs according to legal, contractual and investigation needs.
- Alert on public storage, risky IAM grants, disabled logging, key creation, unusual API use and data exfiltration indicators.
- Maintain a cloud incident runbook covering account compromise, key revocation, isolation, snapshots, evidence capture, notification assessment and recovery.

### 3.5 Backup and resilience
- Maintain encrypted backups with separate access controls and protection against deletion/ransomware.
- Use cross-region or cross-account copies only where justified by resilience and data residency.
- Test restoration, application consistency and recovery time/recovery point objectives.
- Protect backup administration from ordinary workload identities.

### 3.6 Secure delivery and third-party risk
- Protect source repositories, build agents, package registries and release credentials.
- Use signed artefacts and controlled deployment pipelines.
- Scan dependencies and secrets; retain SBOMs and provenance records.
- Review marketplace images, managed integrations, processors and subcontractors.
- Require contractual incident notification, audit rights, data handling and service-exit provisions.

## 4. Common cloud threats and corresponding controls
| Threat | Example | Principal control response |
|---|---|---|
| Misconfigured public storage | Bucket/container or object made public | Block public access by default; policy guardrails; continuous config monitoring |
| Identity compromise | Stolen admin credentials or over-privileged role | Phishing-resistant MFA, least privilege, JIT elevation, anomaly alerts |
| Exposed management/API endpoint | Internet-facing admin or overly broad API | Private endpoints, WAF/API gateway, identity-based access, source restrictions |
| Secret/key leakage | API keys in source, build logs or public files | Secret manager, scanning, rotation, workload identity |
| Ransomware/destructive account activity | Attacker deletes live and backup resources | Separate backup account, immutable protection, least privilege, restore testing |
| Insecure workload image/software | Vulnerable VM/container or unsupported runtime | Hardened images, patch process, dependency/SBOM review, continuous vulnerability management |
| Inadequate audit logging | Control-plane events unavailable during incident | Enable and protect central audit logs; retention and alert testing |
| Supply-chain compromise | Malicious dependency or compromised build | Trusted registries, signatures, provenance, isolated build, dependency review |
| Shadow IT / unmanaged SaaS | Data stored in unapproved consumer services | SaaS inventory, procurement review, identity federation, DLP and offboarding |

## 5. Conditional compliance applicability
- **Nigeria Data Protection Act 2023:** evaluate where HanTech processes personal data as a controller or processor within the Act's scope. Cloud due diligence should include purpose, lawful basis, data minimisation, processor contracts, security safeguards, incident/breach workflow, cross-border transfer and data-subject rights. Confirm exact obligations with HanTech's privacy/legal owner.
- **GDPR:** do not assume it applies merely because a cloud provider is global. Assess whether processing is in the context of an EU establishment or whether a non-EU organisation offers goods/services to data subjects in the EU or monitors behaviour in the EU.
- **HIPAA:** relevant only if HanTech is a covered entity or business associate and handles electronic protected health information. Do not treat all personal or health-related data as automatically subject to HIPAA.
- **PCI DSS v4.0.1:** relevant when HanTech stores, processes or transmits payment-card data, or systems can affect the cardholder data environment. Map the CDE and service-provider responsibilities before selecting controls.
- **NIST CSF 2.0 / CIS Controls v8.1:** voluntary risk-management and safeguard-alignment frameworks unless incorporated into contract, policy or another obligation.

## 6. Minimum evidence required for a live cloud assessment
Before any live review, obtain written authorisation and identify the provider, subscription/account/project, tenant, region and approved assessment role. Then collect only the evidence needed for the agreed scope:

1. Cloud asset and service inventory, account/tenant structure and architecture diagram.
2. Service model classification (IaaS/PaaS/SaaS) and provider responsibility documents.
3. IAM roles, privileged users, service identities, MFA status and access review evidence (redact usernames and secrets).
4. Network security groups, firewall rules, public endpoint/storage exposure and segmentation configuration.
5. Encryption and key-management settings, secret-store configuration and key access policies.
6. Audit logging, central monitoring, alert rules, log retention and incident playbooks.
7. Backup policies, immutability settings, restoration test and recovery objectives.
8. Vulnerability/dependency scan reports, image inventory, secure baseline and remediation tracker.
9. Data inventory, classification, residency, retention and processor/subprocessor information.
10. Change management, procurement, assurance reports and cloud-exit arrangements.

Use read-only inspection first. Do not run penetration tests, destructive simulations, credential validation or data retrieval without specific written authorisation and rules of engagement.

## 7. Cloud assessment checklist
| Control area | Required evidence | Current status |
|---|---|---|
| Provider, tenant and region identified | Written scope and account owner | NOT PROVIDED |
| Service model mapped | Workload-by-workload responsibility matrix | NOT PROVIDED |
| IAM / MFA / privileged access | Redacted access exports and review records | NOT PROVIDED |
| Network segmentation / public exposure | Approved architecture and rule exports | NOT PROVIDED |
| Encryption / keys / secrets | Key policies and secret-management evidence | NOT PROVIDED |
| Logging / monitoring | Audit settings, SIEM ingestion and alert test | NOT PROVIDED |
| Backup / resilience | Backup configuration and restoration record | NOT PROVIDED |
| Vulnerability / secure configuration | Scan and baseline reports | NOT PROVIDED |
| Privacy / compliance applicability | Data-flow map, contracts and legal review | NOT PROVIDED |
| Incident response / exit | Runbook, exercise and provider exit plan | NOT PROVIDED |

## 8. Findings and conclusion
No cloud misconfiguration finding can be confirmed from the information currently available because no cloud tenant or service has been identified or supplied. The deliverable at this stage is a baseline control assessment and evidence-collection plan. A live cloud assessment must remain **NOT STARTED / OUT OF SCOPE** until the team receives a named environment, authorised assessment identity, written scope and approval.

Task 7's desk-based cloud-security deliverable is complete for this project. A live cloud assessment is not started because no provider, tenant, workload, authorised identity or written scope was supplied. No instructor dependency is assumed. Any later live review requires explicit project-owner authorisation and a defined tenant scope.

## 9. Authoritative references
- AWS shared responsibility model: https://aws.amazon.com/compliance/shared-responsibility-model/  
- Microsoft Azure shared responsibility: https://learn.microsoft.com/en-ca/azure/security/fundamentals/shared-responsibility  
- Google Cloud shared fate and shared responsibility: https://docs.cloud.google.com/architecture/framework/security/shared-responsibility-shared-fate  
- Google Cloud IAM secure-use guidance: https://docs.cloud.google.com/iam/docs/using-iam-securely  
- Google Cloud Zero Trust guidance: https://docs.cloud.google.com/architecture/framework/security/implement-zero-trust  
- NIST SP 800-63B (Digital Identity Guidelines): https://pages.nist.gov/800-63-4/sp800-63b.html  
- Nigeria Data Protection Act 2023: https://ndpc.gov.ng/wp-content/uploads/2024/03/Nigeria_Data_Protection_Act_2023.pdf  
- GDPR Article 3: https://eur-lex.europa.eu/legal-content/EN/TXT/?qid=1496048922207&uri=CELEX%3A32016R0679  
- HHS HIPAA covered entities: https://www.hhs.gov/hipaa/for-professionals/covered-entities/index.html  
- PCI SSC Document Library: https://www.pcisecuritystandards.org/document_library/  
