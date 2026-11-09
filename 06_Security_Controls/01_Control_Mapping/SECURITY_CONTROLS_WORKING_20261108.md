# Security Controls and Recommendations — Working Draft
Status: Initial technical mapping for Adeayo (Task 5) to review, tailor and approve. Control references are indicative mappings to common NIST CSF 2.0 / NIST SP 800-53 control families; confirm exact course-required framework/version before final submission.
| Finding / risk | Preventive control | Detective / corrective control | Verification evidence |
|---|---|---|---|
| NFS wildcard root export | Remove export; dedicated data path; explicit client allowlist; root_squash; read-only by default; firewall RPC/NFS | Periodic export review; file integrity monitoring; NFS access logs | Sanitised exports config; showmount output after remediation; firewall rules |
| Samba candidate | Upgrade to supported patched release; remove username-map script if unnecessary; restrict SMB/RPC | Package inventory; configuration drift monitoring; SMB logs | Package source/build provenance; smb.conf; patch record |
| Anonymous SMB | Disable guest/null-session listing; explicit share ACLs; segment SMB | Review share enumeration and authentication logs | Anonymous enumeration retest showing denial |
| Default credential disclosure | Remove credentials from public content; disable/rotate defaults; least privilege; MFA where possible | Secret scanning; periodic credential audits; web content review | Sanitised page review; account policy evidence |
| Unsupported Apache/PHP | Upgrade to supported stack; remove demo apps/modules; secure configuration | Vulnerability/patch management; version inventory; web logs | Supported version inventory; configuration baseline |
| Telnet/r-services | Disable legacy daemons; SSH with strong cryptography and MFA/bastion | Network monitoring; port scans; auth log review | Listener inventory confirms closed; SSH configuration |
| Tomcat/AJP | Disable unused AJP; bind management connectors to trusted interface; update Tomcat | Connector inventory; access logs; configuration review | server.xml excerpt; socket/listener verification |
| Mutillidae config exposure | Move secrets outside document root; deny direct access; least-privilege filesystem permissions; rotate secrets if disclosure confirmed | Web server access logging; DLP/secret scanning; periodic URL checks | HEAD/GET-safe validation policy; deny response; no secret values captured |
## Cross-cutting control programme
1. Asset inventory and ownership.
2. Secure configuration baselines and change control.
3. Vulnerability and patch management with exception governance.
4. Identity and access management, unique accounts, MFA and least privilege.
5. Network segmentation and secure remote administration.
6. Centralised logging, time synchronisation, alerting and incident response.
7. Backup, recovery and periodic restore testing.
8. Data classification, encryption and secrets management.
9. Third-party/cloud shared-responsibility oversight.
10. Security awareness and policy attestation.
## Acceptance criteria
Each recommendation must identify an owner, implementation priority, cost/effort, dependency, residual risk, measurable test and evidence artefact. Do not claim a control is implemented merely because it is recommended.
