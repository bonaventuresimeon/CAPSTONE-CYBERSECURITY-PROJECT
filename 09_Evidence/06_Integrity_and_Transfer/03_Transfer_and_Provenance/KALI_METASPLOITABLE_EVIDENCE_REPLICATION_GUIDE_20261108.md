# Kali Linux + Metasploitable 2 — Evidence Capture and Replication Guide

**Project:** CAPSTONE PROJECT 138 / HanTech Capstone  
**Date:** 8 November 2026 (Africa/Lagos)  
**Authorised lab target:** Metasploitable 2 only  
**Kali source:** `bonaventure@Whisper`, expected lab address `192.168.138.10/24`  
**Target baseline address:** `192.168.138.20/24` (historical baseline; current address must be reverified)  
**VirtualBox network:** `CAPSTONE138_ISOLATED` — Internal Network  
**Status:** Procedure guide. Do not proceed to scans while the current connectivity gate is FAIL.

## 1. Safety and scope
- Keep Kali and Metasploitable on the VirtualBox Internal Network `CAPSTONE138_ISOLATED`. Do not use Bridged networking or expose Metasploitable to the internet.
- The only approved scan target in this guide is the Metasploitable 2 VM after its current IP is verified.
- Dev Guru, the Windows host, other VMs, public IPs and third-party systems are excluded.
- Do not run exploit modules, vulnerability NSE scripts, brute-force/password tests, credential submissions, NFS mounts, SMB file reads/writes, database logins, WebDAV mutations, or service-changing commands.
- Preserve original terminal output and screenshots. Do not crop/alter evidence originals. Create working copies only when necessary and record source/destination SHA-256.

## 2. Preflight — host and VirtualBox
On the Windows host, open PowerShell and run:
```powershell
& 'C:\Program Files\Oracle\VirtualBox\VBoxManage.exe' list runningvms
& 'C:\Program Files\Oracle\VirtualBox\VBoxManage.exe' showvminfo 'Kali Linux' --machinereadable
& 'C:\Program Files\Oracle\VirtualBox\VBoxManage.exe' showvminfo 'Metasploitable' --machinereadable
```
Verify both VMs are running and NIC 1 for each is attached to `CAPSTONE138_ISOLATED`. Record VM UUIDs, snapshot name/UUID, NIC type, MAC and timestamp. Do not change adapter mode as part of evidence collection.

## 3. Current connectivity gate — Kali
In a Kali terminal:
```bash
date -Is
hostname
ip -br addr
ip route
ip neigh show 192.168.138.20
ping -c 4 -W 2 192.168.138.20
```
Save the complete terminal output to a timestamped text receipt and capture a genuine screenshot. Confirm the source interface is on the intended subnet and the target neighbour state is not FAILED.
**STOP** if ping reports Destination Host Unreachable or neighbour state FAILED. Do not run Nmap or service checks until the target address and link are independently verified.

## 4. Target console checks — read-only
At the Metasploitable console, log in using the lab's authorised local account and run:
```bash
date -Is
hostname
uname -a
cat /etc/issue
ip -br addr
ip link show
ip route
ip neigh
```
Capture the terminal output and screenshot. The target's IP must be confirmed from its own interface output; do not assume the historical address is still assigned.
If the console input channel is not responding, stop and resolve the console/keyboard focus issue. Do not change DHCP, interface, or adapter settings without a separate approved change and rollback plan.

## 5. Non-invasive TCP service inventory — only after connectivity PASS
From Kali, confirm the target IP and run:
```bash
nmap --version
nmap -sT -sV --version-light -T3 --reason -oA /home/bonaventure/CAPSTONE138_METASPLOITABLE_TCP_TOP1000_YYYYMMDD_HHMM 192.168.138.20
```
This is a TCP connect/version inventory of Nmap's default top 1,000 ports. It is not a vulnerability scan. Save all three Nmap output formats (.nmap, .gnmap, .xml), screenshot the final summary and compute SHA-256 for each output.
If a full TCP port inventory is explicitly required and time/impact are acceptable, obtain approval before running:
```bash
nmap -sT -sV --version-light -T3 --reason -p- -oA /home/bonaventure/CAPSTONE138_METASPLOITABLE_TCP_ALL_YYYYMMDD_HHMM 192.168.138.20
```
Do not run the full-port scan while connectivity is unstable.

## 6. Read-only service corroboration already used in this assessment
Use only if the connectivity gate is PASS and the service is within scope:
```bash
curl -I --max-time 5 http://192.168.138.20/
curl -I --max-time 5 http://192.168.138.20:8180/
rpcinfo -p 192.168.138.20
showmount -e 192.168.138.20
smbclient -L //192.168.138.20 -N
smbclient //192.168.138.20/tmp -N -c ls
```
These commands provide HTTP headers, RPC/NFS enumeration and anonymous SMB share/directory metadata. Do not mount NFS, retrieve SMB file contents, authenticate to application/database services or write to shares.
For any output that reveals credentials or secrets, record only the minimum necessary proof and redact secrets from report copies. Preserve the unaltered original under access control.

## 7. Target-side local configuration evidence
If authorised local console access is available, read-only commands previously used include:
```bash
cat /etc/exports
dpkg-query -W apache2 php5 proftpd samba openssh-server
grep -n 'username map script' /etc/samba/smb.conf
ls -l /etc/samba/scripts/mapusers.sh
netstat -plnt
grep -nEv '^[[:space:]]*(#|$)' /etc/inetd.conf
grep -nE 'Connector|port=' /etc/tomcat5.5/server.xml
```
Capture full outputs, command, timestamp, account/privilege context and screenshot. Do not modify configuration, packages or services during evidence collection.

## 8. Evidence handling
For each collection session, retain:
1. Raw command output (.txt or native tool output).
2. Genuine screenshot (.png) showing command and result.
3. CSV inventory where tabular data is involved.
4. SHA-256 manifest with relative path, size, timestamp and digest.
5. Collection receipt documenting operator, source VM, target, method, exact command, time zone, result, limits and errors.
6. Provenance record for every copied evidence item. Keep original source files unchanged.

Use:
```bash
sha256sum /path/to/evidence/*
```
On Windows, independently verify with:
```powershell
Get-FileHash -Algorithm SHA256 -LiteralPath 'FULL_PATH'
```
A copy is accepted only when source and destination hashes match. A successful command or screenshot alone does not prove a vulnerability or remediation.

## 9. Current collection checkpoint — 8 November 2026
The live recheck receipt `CAPSTONE138_LIVE_LAB_RECHECK_20261108.txt` records both VMs running on the correct internal network and Kali at `192.168.138.10/24`. The current Kali display showed four Destination Host Unreachable responses to `192.168.138.20` and neighbour state FAILED. The Metasploitable display showed a local `msfadmin` shell prompt, but its current IP/interface state was not verified. Therefore the current scan gate is **FAIL / RECHECK REQUIRED**. The earlier TCP inventory and service reviews are retained as historical evidence from their original collection times; they are not proof of present connectivity.

## 10. Promotion criteria
A work item may be marked complete only when the raw output, screenshot, reproducible command, timestamp, target scope, limitations and integrity hash are present and independently checked. A detected service banner is not a confirmed vulnerability. A configuration weakness may be confirmed from configuration evidence without testing exploit impact. Risk ratings require business context and owner review. Proposed controls are not implemented controls until a separate authorised remediation and retest is evidenced.


## Current checkpoint update — 8 November 2026 (13:16–13:19 WAT)
The earlier note describing a connectivity failure is superseded by the later verified recovery. Metasploitable console showed eth0 UP at 192.168.138.20/24; Kali ping passed 4/4 with 0% loss. A full TCP scan then completed over all 65,535 TCP ports (30 open, 65,505 closed, 66.72 seconds). Native outputs and a 30-row service inventory are preserved in the evidence folder. Guest and host SHA-256 values for the native .nmap/.gnmap/.xml outputs match exactly. Do not treat the initial transient neighbour failure as the current state.
