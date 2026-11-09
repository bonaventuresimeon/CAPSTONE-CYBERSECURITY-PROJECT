# Evidence Index — Working
Date: 8 November 2026 | Root: 09_Evidence
## Evidence groups
| Evidence group | Location | Current state |
|---|---|---|
| Preflight and baseline | 00_Preflight | Present |
| Network configuration and DHCP | 01_Network_Configuration | Extensive receipts, logs and screenshots present |
| System/service discovery | 02_System_Discovery | Extensive service validation receipts and screenshots present; still active/in progress |
| Vulnerability assessment | 03_Vulnerability_Assessment | Workstream directory created; consolidated analysis staged; raw source evidence remains in 02 |
| Risk assessment | 04_Risk_Assessment | Working matrix prepared; Task 4 owner review and HanTech context outstanding |
| Security controls | 05_Security_Controls | Working mapping prepared; Task 5 owner review outstanding |
| GRC | 06_GRC | Policy framework draft prepared; owner/framework applicability review outstanding |
| Cloud security | 07_Cloud_Security | Architecture-neutral baseline prepared; provider/scope evidence absent |
| Report/presentation | 08_Report_and_Presentation | Master report outline, executive summary and slide storyboard prepared; final files not assembled |
## Core receipts
- 01_Network_Configuration\CAPSTONE138_DHCP_AND_BIDIRECTIONAL_NETWORK_FINAL_VERIFICATION_20261108.txt
- 02_System_Discovery\CAPSTONE138_INITIAL_TCP_SERVICE_DISCOVERY_20261108.txt
- 02_System_Discovery\CAPSTONE138_FIVE_PRIORITY_FINDINGS_RISK_REGISTER_20261108.txt
- 02_System_Discovery\CAPSTONE138_SAMBA_CVE_2007_2447_APPLICABILITY_REVIEW_20261108.txt
- 02_System_Discovery\CAPSTONE138_TELNET_RSH_SERVICE_EXPOSURE_REVIEW_20261108.txt
- 02_System_Discovery\CAPSTONE138_TOMCAT_5_5_AJP_8180_SERVICE_REVIEW_20261108.txt
- 02_System_Discovery\CAPSTONE138_WEB_APPLICATION_CONFIGURATION_AND_SENSITIVE_FILE_REVIEW_20261108.txt
- 02_System_Discovery\CAPSTONE138_APACHE_PHP_HANDLER_AND_CVE_PREREQUISITE_REVIEW_20261108.txt
## Current integrity checkpoint
A fresh SHA-256 manifest was generated after the documentation updates: 353 file records, zero duplicate paths, zero missing paths; an independent rehash of all manifest entries returned zero missing/hash-mismatch errors. Manifest: SHA256_EVIDENCE_MANIFEST_CURRENT_20261108.csv. The manifest file itself is excluded from its own record set. Re-run after any subsequent file changes.


## 8 November 2026 — evidence distribution and live lab recheck
- Existing raw source evidence was preserved in 02_System_Discovery; byte-identical working copies were placed into dedicated vulnerability, risk and security-control evidence packets.
- Distribution receipt: CAPSTONE138_EVIDENCE_DISTRIBUTION_RECEIPT_20261108.txt.
- Provenance CSV: CAPSTONE138_EVIDENCE_DISTRIBUTION_PROVENANCE_20261108.csv. Initial result: 47 copied files, 47 source/destination SHA-256 matches, zero missing/mismatch records (47 = 26 vulnerability, 11 risk, 10 controls).
- Live lab recheck: CAPSTONE138_LIVE_LAB_RECHECK_20261108.txt. It records both VMs running on CAPSTONE138_ISOLATED, Kali eth0 at 192.168.138.10/24, but current Kali ping to 192.168.138.20 returns Destination Host Unreachable and neighbour state FAILED.
- Current target IP/interface state is NOT VERIFIED in this recheck. Metasploitable display shows an interactive msfadmin shell prompt; VirtualBox guest properties are unavailable for this VM.
- The earlier successful Nmap/service validation receipts remain historical evidence for their recorded time. They do not prove the target is reachable now. No further scan should be run until reachability is restored and rechecked.
- Current screenshots and hashes are recorded in the live lab recheck receipt. The SHA-256 project manifest must be regenerated after these additions.


## Full TCP discovery and evidence packet update — 8 November 2026
- Current Kali-to-Metasploitable connectivity passed at 13:16–13:17 WAT (4/4 ICMP replies, 0% loss); target console confirmed eth0 UP at 192.168.138.20/24 and MAC 08:00:27:f8:7d:a3. See CAPSTONE138_LIVE_LAB_RECHECK_20261108.txt and the associated screenshots.
- Full TCP scan completed at 13:18:03–13:19:10 WAT: Nmap 7.98, TCP connect/version-light, ports 1–65535, 30 open / 65,505 closed, 66.72 seconds. Native .nmap/.gnmap/.xml files and derived CSV are stored in 02_System_Discovery.
- Guest-side SHA-256 values were independently compared with Windows hashes after base64 byte transfer. All three native outputs are byte-identical; see CAPSTONE138_GUEST_OUTPUT_HASH_VERIFICATION_20261108.txt.
- New service research leads (distccd 3632, IRC 6697, Ruby DRb 8787, and unknown ports 33543/47335/47852/60679) are documented as leads only, not additional confirmed vulnerabilities.
- Dedicated vulnerability evidence packet now includes 26 initial source items plus 9 full-scan/lab items and the new service research note. Provenance CSV now contains 57 copy records; all must be rehashed before final acceptance.
- UDP scanning and vulnerability NSE scripts were not run. No exploit/authentication/brute force was performed.
