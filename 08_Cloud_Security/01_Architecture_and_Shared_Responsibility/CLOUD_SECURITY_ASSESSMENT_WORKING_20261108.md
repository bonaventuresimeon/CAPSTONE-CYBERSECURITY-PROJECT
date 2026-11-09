# Cloud Security — Working Assessment
Status: Architecture-neutral baseline. No HanTech cloud provider, tenant, workload or configuration evidence has been supplied or tested. This is a control-design assessment, not a cloud audit.
## Shared responsibility
HanTech must identify each cloud service model (IaaS/PaaS/SaaS), provider, tenant, region, workload and data class. Provider responsibility varies by service model; customer responsibility remains for data governance, identities, access, configuration, endpoint security and appropriate workload controls. Record the provider's responsibility matrix and contract/SLA.
## Required security domains
- Identity: central identity provider, MFA, conditional access, least privilege, privileged identity management, service-account lifecycle and periodic access reviews.
- Network: private-by-default services, segmentation, security groups, ingress/egress allowlists, private endpoints, WAF where appropriate, secure DNS and flow logs.
- Data: classification, encryption at rest/in transit, key ownership/rotation, secrets vault, DLP, backup and retention.
- Workload: hardened images, patching, vulnerability management, container/image scanning, secure CI/CD, signed artefacts and runtime protection.
- Monitoring: central audit logs, immutable retention, alerting, incident response integration, time synchronisation and cloud posture monitoring.
- Resilience: multi-zone design where justified, tested backups, disaster recovery, RTO/RPO and ransomware recovery.
- Governance: landing-zone guardrails, approved regions, resource tagging, cost controls, configuration policy, third-party assurance and exception register.
## Threat scenarios and treatments
| Threat | Control response | Evidence required |
|---|---|---|
| Publicly exposed storage | Block public access by default; policy guardrails; access logging | Storage policy and access test |
| Stolen cloud credentials | MFA, phishing-resistant auth for admins, conditional access, short-lived credentials | IAM policy and sign-in logs |
| Overprivileged role/service principal | Least privilege, scoped roles, periodic entitlement review | Role export and review record |
| Exposed secrets | Managed secrets vault, rotation, secret scanning | Vault policy and scan report (values redacted) |
| Misconfigured security group | IaC policy checks, deny-by-default ingress, change approval | Rule export and change record |
| Inadequate audit logging | Enable control-plane/data-plane logs, centralise and retain | Logging configuration and sample event |
| Backup compromise | Immutable/offline backups, separate admin plane, restore exercises | Backup policy and restore test |
## Evidence gap
Before claiming a cloud finding, obtain authorised provider/account scope, architecture diagram, service inventory, IAM exports, network policy exports, storage settings, logging/backup configuration and relevant screenshots. Do not connect to or probe any cloud tenant without explicit scope and authorisation.
