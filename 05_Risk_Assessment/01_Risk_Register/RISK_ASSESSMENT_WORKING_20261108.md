# HanTech Capstone — Risk Assessment Working Draft
Status: INITIAL DRAFT — requires Abundance's Task 4 review and HanTech business context.
## Method
Use a qualitative 5x5 model. Likelihood: 1 Rare, 2 Unlikely, 3 Possible, 4 Likely, 5 Almost certain. Impact: 1 Insignificant, 2 Minor, 3 Moderate, 4 Major, 5 Severe. Inherent score = likelihood × impact. Suggested bands: 1–4 Low; 5–9 Moderate; 10–16 High; 17–25 Critical. These are provisional lab-context ratings, not a formal client risk acceptance. Re-score against asset criticality, real network exposure, business processes and compensating controls.
## Provisional risk register
| ID | Risk scenario | Likelihood | Impact | Score | Provisional rating | Treatment |
|---|---|---:|---:|---:|---|---|
| R-01 / F-01 | Wildcard writable NFS root export with no_root_squash could permit severe host compromise if reachable by an untrusted client | 4 | 5 | 20 | Critical | Remove root export; explicit client allowlist; root_squash; read-only dedicated data export; firewall |
| R-02 / F-02 | Samba username-map command injection may permit remote command execution if installed binary is unpatched and vector conditions hold | 3 | 5 | 15 | High | Verify build provenance; patch/upgrade; disable hook; restrict SMB/RPC |
| R-03 / F-03 | Anonymous SMB listing reveals share names and directory metadata | 4 | 2 | 8 | Moderate | Disable guest/null-session enumeration; ACL shares; segment SMB |
| R-04 / F-04 | Publicly disclosed default credentials may enable account access if still valid | 4 | 4 | 16 | High | Remove disclosure; rotate/disable defaults; MFA where supported; least privilege |
| R-05 / F-05 | Unsupported Apache/PHP components may expose unpatched known weaknesses | 4 | 4 | 16 | High | Migrate to supported OS/runtime; isolate until migrated |
| R-06 / F-06 | Telnet/r-services expose cleartext or legacy remote administration paths | 3 | 4 | 12 | High | Disable; replace with SSH; source-IP allowlist |
| R-07 / F-07 | Legacy Tomcat HTTP/AJP connectors increase attack surface | 3 | 3 | 9 | Moderate | Disable unused AJP; restrict connector access; upgrade supported stack |
| R-08 / F-10 | Remotely accessible plaintext application configuration resource may disclose sensitive DB settings if GET returns content | 4 | 4 | 16 | High (provisional) | Deny web access to config; move secrets outside web root; rotate secrets if exposure confirmed; retest safely |
| R-09 / F-08 | PHP advisory-gap research lead | 2 | 3 | 6 | Moderate / unconfirmed | Keep as monitoring item; no vulnerability claim pending exact prerequisites |
| R-10 / F-09 | Apache advisory-gap research lead | 2 | 3 | 6 | Moderate / unconfirmed | Keep as monitoring item; no vulnerability claim pending exact prerequisites |

The score table is a working risk hypothesis. It must not be represented as a client-approved risk assessment. R-09/R-10 are not validated vulnerabilities and may be excluded from the final vulnerability count. F-10 remote HTTP status is confirmed, but actual secret values were deliberately not retrieved; business impact is therefore conditional.
## Required Task 4 inputs
- HanTech asset owner, business criticality, data classification and business impact.
- Exposure context (internal, internet-facing, remote workforce, trust zones).
- Existing controls and control effectiveness.
- Risk appetite, treatment owner, due date and formal acceptance authority.
- Confirm whether the course expects CVSS, qualitative matrix, or both. CVSS must only be assigned to a specific CVE with defensible applicability.
