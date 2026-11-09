

## 9. Full TCP inventory and targeted corroboration reconciliation — 9 November 2026
The 23-port table in Section 4 reflects the earlier top-1,000 TCP baseline and is retained as historical context. The authoritative full TCP Nmap scan covered ports 1–65535 and reported 30 open / 65,505 closed. The seven additional TCP rows are now represented in `SERVICE_INVENTORY.csv` and were independently reconfirmed by the 9 November targeted TCP recheck:

| Port | Protocol | Identification | Corroboration / limitation |
|---:|---|---|---|
| 3632 | TCP | distccd v1 / GNU 4.2.4 | Full scan identification and targeted recheck; no protocol interaction or exploit test |
| 6697 | TCP | UnrealIRCd | Open in both scans; version and binary provenance unresolved |
| 8787 | TCP | Ruby DRb RMI / Ruby 1.8 | Full scan identification and targeted recheck; no RMI interaction |
| 33543 | TCP | Unknown | Open in both scans; service unidentified |
| 47335 | TCP | Unknown | Open in both scans; service unidentified |
| 47852 | TCP | Unknown | Open in both scans; service unidentified |
| 60679 | TCP | Unknown | Open in both scans; service unidentified |

These seven ports complete the 30-port TCP inventory. The full-scan native outputs and receipt are in `09_Evidence/02_System_Discovery`; the targeted confirmation is in `CAPSTONE138_SCAN_FOLLOWUP_20261109/capstone138_20261109`. The 4 unknown high ports remain inventory observations only. No finding or CVE is promoted from their open state.

The UDP section remains top-100 only. Confirmed open responses were 53, 111, 137 and 2049; 68, 69 and 138 remain open|filtered/no-response, and 93 were closed. UDP 137 is NetBIOS name service only and is not used as evidence of SMB share access. UDP 2049's Nmap label is not relied on to prove the NFS export; the NFS finding relies on the independent showmount, rpcinfo and `/etc/exports` evidence in the configuration-validation receipt.

The five priority findings' current IDs, historical-ID aliases, service/port relationships and risk scores are reconciled in `04_Vulnerability_Assessment/CAPSTONE138_FINDING_AND_RISK_RECONCILIATION_20261109.md`. No new vulnerability is inferred from the full TCP/UDP inventory alone.
