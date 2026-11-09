# System and Service Discovery Summary
Status: Initial TCP discovery complete; detailed non-invasive validation remains active.
## Lab scope
Kali (bonaventure@Whisper) 192.168.138.10; Metasploitable 2 192.168.138.20; VirtualBox Internal Network CAPSTONE138_ISOLATED. Dev Guru excluded pending instructor clarification.
## Inventory
Initial Nmap 7.98 command: nmap -sV --version-light -T3 -oN /home/bonaventure/CAPSTONE138_METASPLOITABLE_TCP_DISCOVERY_20261108.txt 192.168.138.20. Result: 23 open and 977 closed ports in default top-1,000 TCP port set. This was service/version discovery, not a vulnerability scan.
Service families observed include FTP, SSH, Telnet, HTTP/Apache/PHP, SMB/Samba, NFS/RPC, MySQL, PostgreSQL, r-services, VNC/X11, UnrealIRCd, Java RMI, AJP/Tomcat and bindshell labels. See 09_Evidence/02_System_Discovery/CAPSTONE138_INITIAL_TCP_SERVICE_DISCOVERY_20261108.txt for exact port/service output.
## Validation status
NFS wildcard root export and anonymous SMB listing are directly evidenced. HTTP landing page discloses default lab credentials. Apache/PHP versions are directly evidenced and unsupported. Samba CVE-2007-2447 is a high-confidence applicability candidate but patch state unresolved. Telnet/r-services and Tomcat/AJP listeners are confirmed exposures; exact impact/CVE applicability not established. Mutillidae config resource remote HEAD returned 200 text/plain from Kali; body not retrieved. ProFTPD and UnrealIRCd remain research/validation leads, not confirmed CVEs.
## Limitations
No exploitation, password submission, brute force, NFS mount, remote file read/write, upload/delete, or vulnerability NSE scan. The target is a training VM, not HanTech production evidence.


## Full TCP coverage update — 8 November 2026 (13:18–13:19 WAT)
A fresh full-range TCP connect/version scan was completed from Kali to Metasploitable 2 after the live connectivity gate passed.
- Exact command: `nmap -sT -sV --version-light -T3 --reason -p- -oA /home/bonaventure/CAPSTONE138_METASPLOITABLE_TCP_ALL_20261108 192.168.138.20`.
- Nmap 7.98 covered TCP ports 1–65535; target up; 30 open and 65,505 closed; 66.72 seconds.
- The 30 open ports are in `09_Evidence/02_System_Discovery/CAPSTONE138_METASPLOITABLE_TCP_ALL_20261108.nmap`; structured outputs (.gnmap/.xml) and a derived CSV are preserved alongside it.
- Additional open ports beyond the prior top-1,000 baseline: 3632/tcp distccd, 6697/tcp IRC, 8787/tcp Ruby DRb, and 33543, 47335, 47852, 60679/tcp (service unknown by this probe). The earlier inventory did not include these because it scanned only the default top 1,000 TCP ports.
- New derived inventory: `SERVICE_INVENTORY_FULL_TCP_20261108.csv`. Raw scan receipt: `09_Evidence/02_System_Discovery/CAPSTONE138_FULL_TCP_DISCOVERY_RECEIPT_20261108.txt`.
- No UDP scan, NSE/vulnerability script, authentication, brute force or exploitation was performed. Service/version strings are probe results, not CVE confirmation.
