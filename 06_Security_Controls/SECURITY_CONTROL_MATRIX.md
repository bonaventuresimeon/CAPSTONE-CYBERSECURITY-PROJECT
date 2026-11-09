# Security Controls and Recommendations Matrix
**Project:** HanTech — From Vulnerability to Compliance  
**Date:** 8 November 2026  
**Task owner:** Adeayo — Task 5, Security Controls & Recommendations  
**Status:** PROJECT CONTROL DESIGN DELIVERABLE COMPLETE — implementation evidence not supplied

## 1. Control design approach
Controls below are proposed for the fictional HanTech environment based on weaknesses observed in the isolated Metasploitable 2 training VM. They are recommendations, not proof that controls have been implemented in a real HanTech environment. Any change to the lab target requires explicit project-owner approval; no remediation change is made by this document.

Controls are grouped as preventive, detective and corrective. A control is not considered implemented until the owner supplies configuration, procedure, log or test evidence.

## 2. Finding-to-control matrix
| Finding | Preventive controls | Detective controls | Corrective / recovery controls | Evidence required for closure |
|---|---|---|---|---|
| F-01 NFS root export wildcard/rw/no_root_squash | Remove root export; export only required data paths; explicit client allowlist; ro by default; root_squash; firewall NFS/RPC | Periodic export inventory; NFS/RPC access logs; alerts for new wildcard exports or no_root_squash | Revoke unsafe export; restore affected files from trusted backup; rotate exposed credentials/keys if exposure is suspected | Approved exports configuration; network ACL; change record; post-change showmount/config output; monitoring alert test |
| F-02 Anonymous SMB enumeration | Disable guest/null-session enumeration; remove unused shares; per-share ACLs; SMB segmentation; supported Samba release | Audit guest logons, share enumeration and permission changes; alert on unexpected guest access | Disable guest mapping; revoke anonymous permissions; restore share ACLs; review access history | smb.conf/ACL evidence; guest test result with authorisation; share inventory; logs |
| F-03 Mutillidae config file HTTP exposure | Move configuration outside web root; deny config extensions/paths at server layer; managed secret vault; restrictive filesystem ACLs; deployment checks to reject secrets under document root | Web access log monitoring for config paths; secret scanning of web roots and repositories; external attack-surface checks | Remove exposure; rotate credentials if any secret was served; investigate access logs; redeploy from clean configuration | Web-server deny response; document-root and permissions evidence; secret-scanning report; credential rotation record; log review |
| F-04 Default credential disclosure | Remove credential strings from public content; disable/change default accounts; unique managed secrets; MFA for privileged accounts; secret-management process | Website content scanning; default-account review; authentication anomaly monitoring; periodic credential exposure checks | Rotate/revoke disclosed secrets; disable unused accounts; investigate any suspicious authentication | Updated page/source; account inventory; rotation record; MFA policy/enrolment evidence; alert/log sample |
| F-05 Telnet and Berkeley r-services | Disable Telnet/rsh/rlogin/rexec; use supported SSHv2; enforce MFA for privileged remote access; management subnet/allowlist; secure cipher policy | Port/service inventory; configuration drift monitoring; authentication and privileged-session logging | Terminate obsolete listener; revoke trust files and unnecessary accounts; rotate credentials where exposure is suspected | Listener scan showing closed ports; service configuration; SSH hardening; MFA evidence; access logs |
| Cross-cutting unsupported web stack | Migrate to supported OS, Apache/PHP and application releases; remove demo apps/modules; secure build pipeline; documented exception only with owner and expiry | Software asset inventory; authenticated vulnerability scanning after approval; SBOM and patch-age dashboard | Patch/migrate; isolate legacy service until replacement; restore clean supported image | Supported version inventory; vendor advisory mapping; change ticket; retest report |
| WebDAV configuration lead | Disable DAV if not business-required; otherwise require auth and scoped methods; remove directory indexing; least-privilege directory mode | HTTP method/config audit; review access logs; detect unexpected writes | Disable DAV or restore hardened access rules; assess any prior write activity | Effective vhost config; permissions; authorised HEAD/OPTIONS check; change approval |
| Tomcat/AJP exposure | Disable AJP if unused; bind to loopback/private service network; secret/connector hardening; restrict HTTP management paths | Listener inventory; connector configuration drift checks | Disable unnecessary connector; update to supported Tomcat/JDK/OS | server.xml, socket binding, network ACL and post-change service inventory |

## 3. Control implementation order
1. **Critical first:** F-01 NFS export; remove the root export and restrict NFS clients.
2. **High priority:** F-03 exposed Mutillidae configuration and F-04 public credential disclosure; remove resources and rotate credentials if verified.
3. **High priority:** F-05 disable Telnet and r-services, migrate administration to hardened SSH.
4. **Moderate:** F-02 restrict SMB anonymous enumeration and share permissions.
5. **Strategic:** modernise the unsupported operating system/web stack and remove unused demo services.
6. **Conditional:** close WebDAV and AJP exposure after service-owner confirmation.

## 4. Cross-cutting enterprise controls
- Asset inventory: every service has an owner, business purpose, classification, environment and approved exposure.
- Secure configuration baseline: approved settings, least functionality, change control and periodic compliance checks.
- Vulnerability management: risk-based remediation SLAs, vendor advisory tracking, exception expiry and retesting.
- Identity and access: least privilege, MFA, unique identities, service-account ownership, privileged access management and prompt offboarding.
- Data protection: classification, encryption in transit/at rest, secret management, retention and secure disposal.
- Logging and response: centralised security logs, time synchronisation, detection rules, incident playbooks and evidence preservation.
- Resilience: tested backups, recovery procedures, service continuity objectives and restoration validation.
- Third-party/cloud oversight: due diligence, contract controls, provider assurance, data-location review and shared-responsibility mapping.

## 5. Proposed closure criteria
A remediation item is closed only when:
1. The change has an owner, approval and change record.
2. The configuration or control evidence is captured.
3. A safe validation demonstrates the risky condition is removed or appropriately constrained.
4. Logs/monitoring can detect recurrence where appropriate.
5. The new evidence is timestamped, stored under 09_Evidence, and SHA-256 recorded.
6. Residual risk and any exception are signed off by the accountable owner.

## 6. Evidence boundaries
No controls described above have been applied to the Metasploitable target as part of this documentation exercise. Do not mark a recommendation as implemented merely because it appears in this matrix. No production HanTech configuration, cloud tenant or real business asset has been supplied for control testing.

## 7. Standards mapping
- NIST CSF 2.0: GOVERN, IDENTIFY, PROTECT, DETECT, RESPOND and RECOVER functions. https://www.nist.gov/publications/nist-cybersecurity-framework-csf-20
- CIS Critical Security Controls v8.1: safeguards supporting enterprise asset, configuration, access, vulnerability, logging, recovery and service-provider management. https://www.cisecurity.org/controls/v8-1
- OWASP ASVS 5.0.0: application security verification requirements for web application design and implementation. https://asvs.owasp.org/
- NIST SP 800-53 Rev. 5: security and privacy control catalogue. https://csrc.nist.gov/pubs/sp/800/53/r5/upd1/final

## 8. Owner review
Task 5 is allocated to Adeayo in the project task-allocation record. The control-design deliverable is complete and maps preventive, detective and corrective controls to the findings. The name is an allocation label; no personal sign-off is claimed. Controls remain recommendations because no HanTech production implementation evidence was supplied.
