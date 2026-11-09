# Risk Assessment Method and Register
**Project:** HanTech — From Vulnerability to Compliance  
**Assessment date:** 8 November 2026  
**Scope:** Lab observations from Metasploitable 2 (192.168.138.20) only  
**Status:** PROJECT RISK DELIVERABLE COMPLETE — provisional for HanTech business context

## 1. Purpose and limitations
This register translates observed security weaknesses into likelihood, impact and contextual risk for the fictional HanTech case study. It is not a risk assessment of HanTech production assets. The real asset value, data classification, user population, network boundaries, business dependencies and compensating controls have not been supplied. The ratings must be revisited when those facts are known.

The ratings are not CVSS scores. CVSS communicates technical vulnerability severity for a specified vulnerability and scoring version; the business risk rating here considers the observed configuration, exposure, likelihood, impact and HanTech scenario assumptions separately. No CVSS score is invented for configuration findings without a specific CVE.

## 2. Qualitative scoring method
Likelihood and impact are each scored from 1 to 5.

| Score | Likelihood | Impact |
|---:|---|---|
| 1 | Rare; tightly constrained and unlikely | Negligible operational or data effect |
| 2 | Unlikely; additional barriers exist | Limited local effect or low-sensitivity information |
| 3 | Possible; reachable under plausible conditions | Material but recoverable service/data effect |
| 4 | Likely; exposure or prerequisite directly observed | Major confidentiality, integrity or availability consequence |
| 5 | Almost certain under the stated exposure | Severe enterprise-wide, privileged or regulated-data consequence |

**Risk score = Likelihood × Impact.**

| Score band | Rating |
|---:|---|
| 1–4 | Low |
| 5–9 | Moderate |
| 10–16 | High |
| 17–25 | Critical |

The score supports prioritisation; it does not replace professional judgement. A high-impact scenario that has not been safely tested must remain identified as potential impact, not described as observed compromise.

## 3. Provisional risk register
| ID | Finding | Likelihood | Impact | Score | Rating | Confidence / qualification |
|---|---|---:|---:|---:|---|---|
| F-01 | NFS root filesystem wildcard export with rw and no_root_squash | 4 | 5 | 20 | CRITICAL | Configuration directly confirmed; remote mount/read/write impact not tested. Critical is the potential risk if an untrusted reachable client is accepted by the export. |
| F-02 | Anonymous SMB share enumeration and tmp metadata disclosure | 4 | 2 | 8 | MODERATE | Anonymous enumeration and directory listing reproduced; file content and write access not tested. |
| F-03 | Mutillidae database-configuration resource served as text/plain over HTTP | 4 | 4 | 16 | HIGH (PROVISIONAL) | Remote HEAD response confirmed; actual values, credential validity and database access intentionally not retrieved/tested. Score follows the allocated owner's working model and remains conditional on business context. |
| F-04 | Default lab credential pair disclosed on public landing page | 4 | 4 | 16 | HIGH (PROVISIONAL) | Disclosure is directly visible; credential validity and privileges are unknown. Score follows the allocated owner's working model and remains conditional on business context. |
| F-05 | Telnet and Berkeley r-services listening on all IPv4 interfaces | 3 | 4 | 12 | HIGH (PROVISIONAL) | Listener and service definitions confirmed; authentication, trust and command access not tested. Score follows the allocated owner's working model and remains conditional on business context. |

**Risk order:** F-01; F-03/F-04 (tie); F-05; F-02. This order follows the allocated owner's working 5x5 model and is provisional for the observed lab configuration, not a claim about HanTech production risk.

## 4. Additional risk leads
| Lead | Current risk handling |
|---|---|
| Samba CVE-2007-2447 | Treat as a high-priority candidate; exact package patch provenance unresolved. Keep separate from confirmed findings and do not calculate a new target-specific CVSS score. A historical CVSS v2 base score of 6.0 appears in reference data, but attack prerequisites and vendor patch state must be validated before use in final prioritisation. |
| Unsupported Apache/PHP | Treat as lifecycle/maintenance risk. Ubuntu backports security fixes, so compare exact package revisions and prerequisites rather than relying on upstream banner alone. |
| WebDAV | Confirmed DAV configuration and world-writable backing-directory observation; unauthenticated file mutation not tested. |
| Tomcat/AJP, ProFTPD, UnrealIRCd | Maintain as service-specific exposure or validation leads. Do not elevate to CVE-confirmed without build/patch and prerequisite evidence. |

## 5. Assumptions and sensitivity
1. The five scores assume that a threat actor could reach the lab service from a network segment connected to the target. The isolated lab has only the two authorised guest VMs; production reachability may be substantially different.
2. NFS impact assumes the export's wildcard client rule accepts a client that can reach the NFS service. The actual mount and resulting file access were not tested.
3. Mutillidae impact assumes the served resource could include sensitive configuration values. Only key names were identified locally; values were not retrieved.
4. Credential disclosure impact assumes a risk that the displayed pair may still be enabled. It was not tested.
5. Telnet/r-services impact assumes that the exposed protocol creates a weak remote-access boundary. No authentication or trust relationship was tested.
6. The fictional HanTech's data classification, critical systems, legal obligations, business recovery objectives and existing controls are unknown.

## 6. Risk treatment decisions
- **F-01:** Immediate corrective action; remove the root export, limit NFS to named clients and enforce root squashing. Do not demonstrate impact by mounting or writing to the lab filesystem.
- **F-02:** Reduce exposure; turn off anonymous browsing unless explicitly approved, restrict shares and verify ACLs through authorised read-only configuration review.
- **F-03:** Remove the configuration resource from the document root, deny HTTP access, use a secret store, and review logs. Do not retrieve the body during this assessment.
- **F-04:** Remove the credential string from the page and rotate/disable the associated default account through approved change control; verify account status only with explicit authorisation.
- **F-05:** Disable the legacy listeners and retain supported SSH with strong authentication and network restrictions. Changes require approval and a post-change evidence record.

## 7. Review and ownership
Task 4 is allocated to Abundance in the project task-allocation record. The risk deliverable has been completed from the captured technical evidence using the recorded 5×5 method. The name is an allocation label; no personal sign-off is claimed. Scores remain provisional because HanTech asset criticality, data classification, exposure and compensating controls were not supplied.

## 8. Research references
- NIST SP 800-30 Rev. 1, Guide for Conducting Risk Assessments: https://csrc.nist.gov/pubs/sp/800/30/r1/final  
- NIST Cybersecurity Framework 2.0: https://www.nist.gov/publications/nist-cybersecurity-framework-csf-20  
- CIS Critical Security Controls v8.1: https://www.cisecurity.org/controls/v8-1  
- NFS exports(5): https://man7.org/linux/man-pages/man5/exports.5.html  
- Samba CVE-2007-2447 upstream advisory: https://www.samba.org/samba/security/CVE-2007-2447.html
