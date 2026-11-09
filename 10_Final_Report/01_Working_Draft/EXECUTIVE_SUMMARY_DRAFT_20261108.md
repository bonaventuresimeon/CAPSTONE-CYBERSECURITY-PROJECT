# Executive Summary — Integrated Final Version
**Project:** HanTech Capstone Project 138 — From Vulnerability to Compliance: Securing Legacy and Cloud Systems  
**Date:** 9 November 2026

The project assessed the expressly authorised Metasploitable 2 training target (192.168.138.20) from Kali Linux (192.168.138.10) in the isolated VirtualBox Internal Network CAPSTONE138_ISOLATED. The host was not attached to the isolated network. The assessment was non-exploitative and evidence-led.

A full TCP connect/version-light scan covered ports 1–65535 and identified 30 open and 65,505 closed ports. A targeted TCP recheck reconfirmed seven selected additional ports. UDP top-100 discovery returned four confirmed open responses, three open|filtered/no-response results and 93 closed ports. The UDP result is top-100 coverage only, not a full UDP scan.

Five priority findings are supported by retained configuration or remote-response evidence: (1) wildcard writable NFS root export with root squashing disabled; (2) anonymous SMB share enumeration and directory metadata disclosure; (3) a Mutillidae configuration resource remotely reachable over HTTP as text/plain; (4) default lab credentials displayed on the public HTTP landing page; and (5) Telnet/Berkeley r-services listeners on all IPv4 interfaces. Provisional contextual risk scores are 20 Critical, 8 Moderate, 16 High, 16 High and 12 High. These are qualitative lab-context scores, not CVSS scores or HanTech production risk acceptance.

Samba CVE-2007-2447 remains a high-confidence applicability candidate because observed service/configuration prerequisites appear relevant, but exact installed-binary patch provenance is unresolved. It is not reported as confirmed exploitation. Other service/version leads are not elevated to CVEs without patch, build and prerequisite evidence.

No exploitation, brute force, credential submission, NFS mount, SMB file-content access, Mutillidae configuration-body retrieval, database query or target mutation was performed. Potential impact is therefore clearly separated from observed exposure.

The project also includes a preventive/detective/corrective control matrix, five GRC policy drafts, conditional legal/framework applicability, a cloud shared-responsibility baseline and a prioritised remediation roadmap. Task 7 is complete as a desk-based baseline only because no provider, tenant, workload or written cloud authorisation was supplied. No live cloud assessment or HanTech production assessment is claimed.

The recorded task allocation is Jeffrey (Tasks 1–2), Bonaventure (Tasks 3 and 8), Abundance (Task 4), Adeayo (Task 5) and Amos Talks (Task 6). These are allocation labels from the project record, not fabricated personal signatures or independent approvals. Task 7 has no named assignee in the recorded allocation. No instructor role or approval is assumed. The second system mentioned in the project theme is not identified in the available authorised scope and is recorded as a limitation; no substitute target was invented or scanned.

**Conclusion:** The authorised lab contains material legacy configuration and exposure weaknesses. The project deliverables are integrated and traceable to retained evidence. Production applicability, HanTech risk acceptance, control implementation, formal policy adoption, a second target and live cloud security remain outside the supplied evidence and scope.
