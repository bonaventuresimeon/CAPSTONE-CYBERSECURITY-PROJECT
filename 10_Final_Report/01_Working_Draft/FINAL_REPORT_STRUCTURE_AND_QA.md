# Final Report Structure and Quality-Assurance Checklist
**Project:** HanTech — From Vulnerability to Compliance  
**Report owner / integrator:** Bonaventure (Tasks 3 & 8)  
**Status:** STRUCTURE READY — final owner inputs and QA remain open

## Recommended report structure
1. Title page and document control: title, team, version, date, confidentiality and approval status.
2. Executive summary: purpose, scope, five priority findings, top risk, recommended management decisions and limitations.
3. Engagement background and scope: assignment interpretation, authorisation, in-scope target, out-of-scope systems, assumptions and rules of engagement.
4. Environment and methodology: VirtualBox internal-network topology, target/scanner identity, rollback checkpoint, Nmap method and limitations.
5. System and service inventory: full TCP scan of ports 1–65535 (30 open / 65,505 closed), seven-port targeted TCP corroboration, and UDP top-100 (4 confirmed open / 3 open|filtered / 93 closed), with scope limits and evidence references.
6. Vulnerability identification and validation: five selected evidenced weaknesses; technical evidence; attacker goal; confidence; CVE applicability; limitations.
7. Risk assessment: likelihood, impact, scoring method, contextual rating, residual risk and treatment priority.
8. Security controls: preventive, detective and corrective measures mapped to each finding.
9. GRC policy recommendations: at least four policies, owners, review cadence, approval and evidence of operation.
10. Cloud security assessment: service-model responsibility, IAM/MFA, threats, controls and conditional compliance applicability; state that live tenant review was not performed.
11. Implementation roadmap: immediate, short-term and strategic remediation phases, owners and dependencies.
12. Conclusion and management decisions.
13. References: authoritative vendor, standards, legal and regulator sources.
14. Appendices: evidence index, scan command, inventory CSV, risk register, control matrix, policy register, evidence manifest and limitations.

## Required consistency checks
- State target IP 192.168.138.20 and scanner IP 192.168.138.10 consistently.
- Call the network CAPSTONE138_ISOLATED VirtualBox Internal Network; never call it host-only.
- Do not include Dev Guru in assessed scope unless instructor approval is obtained.
- Full TCP Nmap 7.98 scan covered ports 1–65535 and found 30 open / 65,505 closed; native outputs and receipt are preserved. The 9 November targeted recheck reconfirmed the seven additional TCP ports.
- UDP Nmap 7.98 coverage was top-100 only: 4 confirmed open, 3 open|filtered/no-response, 93 closed. Do not describe this as a full UDP scan; do not count open|filtered as open.
- SERVICE_INVENTORY.csv must reconcile to exactly 30 TCP records and seven UDP observations, with no duplicate protocol/port rows.
- Neither the TCP nor UDP discovery scans were vulnerability scans; no NSE vulnerability scripts or exploitation were run.
- Separate Nmap banner identification from local package/configuration corroboration.
- Do not state or imply exploitation, credential compromise, database access, NFS remote file access, SMB file read/write or WebDAV mutation.
- Mark Samba CVE-2007-2447 as a high-confidence candidate pending exact package patch provenance.
- Do not infer a CVE from a legacy version banner alone; check Ubuntu backports and feature prerequisites.
- Keep the five priority weaknesses distinct from the additional validation leads.
- Keep CVSS version/score separate from contextual business-risk rating. Use N/A where there is no relevant CVE score.
- Do not say the cloud tenant was assessed; no cloud account or named provider was supplied.
- NDPA, GDPR, HIPAA and PCI DSS applicability must be qualified by legal scope and business facts.
- Every finding must point to one or more evidence IDs and raw evidence paths.
- Every recommendation must map to a finding and an owner.
- Dates, owners, version, references and evidence manifest must be consistent.

## Evidence acceptance gate
For each technical statement, confirm: source file exists; screenshot/raw output supports the statement; scope/target and timestamp are recorded; limitations are preserved; file hash is listed in the manifest; and the statement is not stronger than the evidence. A screenshot of a command in progress is not proof of successful completion. A tool's compile/status message is not proof of a real-world outcome.

## Outstanding approvals
- Instructor: clarify the second-system reference and whether the marking rubric accepts evidenced configuration/access-control weaknesses as the five selected vulnerabilities, or expects five CVE-specific items.
- Team coordinator: keep Task 7 open until a remaining member volunteers and cloud scope is authorised.
- Jeffrey: verify/approve lab environment, scope and discovery section.
- Abundance: validate risk methodology and scores.
- Adeayo: validate technical controls and closure evidence.
- Amos Talks: validate policy language, owners and applicable compliance.
- Bonaventure: reconcile all sections, references, evidence IDs and final report.
