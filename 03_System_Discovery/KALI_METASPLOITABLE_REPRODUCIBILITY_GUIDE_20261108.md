# Reproducibility Guide - Kali Linux and Metasploitable 2
Recorded baseline: 8 November 2026 (Africa/Lagos). Host: VirtualBox 7.2.10r174163. Kali: Nmap 7.98, expected 192.168.138.10, MAC 08:00:27:32:09:84. Metasploitable 2: expected 192.168.138.20, MAC 08:00:27:f8:7d:a3. Both Adapter 1 settings: VirtualBox Internal Network CAPSTONE138_ISOLATED; Adapter 2 disabled.
Status: derived from recorded execution. A second reviewer has not yet performed clean-room reproduction.

## Safety and scope
Only assess 192.168.138.20 on CAPSTONE138_ISOLATED. Do not scan the Windows host, Kali, Dev Guru, external addresses or other systems. This is an Internal Network, not host-only. Do not exploit, brute force, submit credentials, mount NFS, read SMB file bodies, write/delete files, log in to applications, query databases, mutate WebDAV or alter target services. Read-only validation only.

## Prerequisites and start
1. Confirm VirtualBox 7.2.10r174163 and both named VMs.
2. Start Kali and Metasploitable 2 from the recorded snapshots: Kali CAPSTONE_PRECONFIG_20261107; target CAPSTONE_DHCP_PRE_CORRECTION_20261108. Do not start Dev Guru or restore/alter snapshots.
3. Confirm Adapter 1 on each VM is Internal Network CAPSTONE138_ISOLATED and Adapter 2 is disabled.
4. On Kali run: ip -br addr; ip route; ip neigh show; ping -c 1 192.168.138.20.
5. On the target console run ifconfig. Verify target IP, MAC and Kali/target identity. Stop if values differ.

Expected baseline: Kali 192.168.138.10/24, target 192.168.138.20, successful ping. Reconfirm each run.

## Recorded TCP discovery
Exact recorded command:
nmap -sV --version-light -T3 -oN /home/bonaventure/CAPSTONE138_METASPLOITABLE_TCP_DISCOVERY_20261108.txt 192.168.138.20

This was run as an unprivileged Kali user against Nmap's default top-1,000 TCP port set using TCP connect scan. It did not scan UDP, all TCP ports or use vulnerability scripts. Recorded result: one host up, 23 open and 977 closed TCP ports; 16.52 seconds; Nmap 7.98.

For a fresh run, create a new timestamped folder and raw formats:
mkdir -p ~/CAPSTONE138_EVIDENCE_$(date +%Y%m%d_%H%M%S)
OUT=~/CAPSTONE138_EVIDENCE_$(date +%Y%m%d_%H%M%S)/MS2_TCP_TOP1000
nmap -sV --version-light -T3 --reason -oA "$OUT" 192.168.138.20

The -oA command is a recommended repeat, not the original captured command. It creates .nmap, .xml and .gnmap. Verify each exists and is non-zero; never overwrite the original receipt.

## Safe finding-specific checks
Only run from Kali to 192.168.138.20 and preserve output/screenshots.

FR-01 NFS:
rpcinfo -p 192.168.138.20
showmount -e 192.168.138.20
Expected: NFS/RPC services and export / *. On target console cat /etc/exports showed / *(rw,sync,no_root_squash,no_subtree_check). Do not mount NFS.

FR-02 Anonymous SMB:
smbclient -L //192.168.138.20 -N
smbclient //192.168.138.20/tmp -N -c ls
Expected: anonymous login; shares print$, tmp, opt, IPC$ and ADMIN$; tmp listing metadata. Do not fetch file bodies or test write/delete.

FR-03 Mutillidae resource:
curl -sI --max-time 3 http://192.168.138.20/mutillidae/config.inc
Expected: HTTP 200, Content-Length 177, Content-Type text/plain, Apache/2.2.8. HEAD only; do not GET or retrieve secrets.

FR-04 Landing page:
curl -s --max-time 3 http://192.168.138.20/ | grep -F 'msfadmin/msfadmin'
Expected: page displays Login with msfadmin/msfadmin to get started. Do not submit credentials.

FR-05 Legacy remote listeners:
On target console, netstat -plnt and grep -nE '^(telnet|shell|login|exec)' /etc/inetd.conf.
Expected: listeners on 0.0.0.0 TCP 23, 512, 513, 514 with active definitions. Do not open remote sessions or test authentication/trust.

## Evidence requirements
For each run save raw Nmap .nmap/.xml/.gnmap; exact command transcript; Nmap and tool versions; timestamp/timezone; target identity and network; CSV service inventory; genuine screenshots of target identity, command and completed result; per-finding evidence record; SHA-256 hashes.
Hash commands: sha256sum file1 file2 file3; sha256sum -c SHA256SUMS.txt. Windows: Get-FileHash -Algorithm SHA256 'C:\path\to\evidence-file'. Hashes prove file integrity since calculation, not test correctness or exploitability.
Use actual terminal screenshots, do not create or edit synthetic evidence. Retain failures and label them failed/incomplete.

## Independent reviewer and troubleshooting
A second reviewer must verify VM IDs/snapshots/adapters, IP/MAC, rerun read-only commands, compare outputs, inspect screenshots/raw logs, recalculate hashes and record reviewer/date/deviations. Until then, clean-room reproduction is PENDING.
No ping: check both guests on, Internal Network name and IP/MAC. Do not bridge. DHCP mismatch: compare client MAC and leases, preserve historical evidence. Nmap down: confirm ARP/ping/target identity before considering -Pn. Service differences: inspect snapshot and state; do not infer a CVE from a banner. SMB denied: check port/service/tool; no password guessing. HEAD differs: retain response headers, don't retrieve a secret body. Hash mismatch: preserve both copies and document before correction.

## Known gap
The 8 November receipt says guest-side Nmap output is /home/bonaventure/CAPSTONE138_METASPLOITABLE_TCP_DISCOVERY_20261108.txt. The Windows project inventory did not show copied .nmap/.xml/.gnmap files at audit time. Current guest file existence and copy to the workspace remain REQUIRES VALIDATION. No new scan was run in this documentation pass.
