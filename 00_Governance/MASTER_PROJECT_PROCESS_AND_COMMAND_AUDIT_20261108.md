# HAN TECH CAPSTONE — MASTER PROCESS & COMMAND-LINE AUDIT

**Project:** CAPSTONE PROJECT 138 — From Vulnerability to Compliance: Securing Legacy and Cloud Systems at HanTech
**Audit cut-off:** 8 November 2026 (local host evidence timestamps)
**Host:** PHAMOUS / Windows user CHINEDU
**Operator:** ChatGPT via authorised Desktop Commander session
**Purpose:** Consolidated, evidence-led record of project activity, configuration changes, commands and visual evidence.

> **Completeness statement:** This audit consolidates every process and command recoverable from the project folder's retained execution logs, evidence records, current session tool execution and available PowerShell history. It does not claim that an unretained interactive keystroke or command is recoverable. Where an exact command was not preserved, it is marked unrecovered rather than reconstructed or invented. The raw source records remain preserved in `09_Evidence`.

## 1. Project mandate and boundaries
- TS Academy capstone deadline: 21 November 2026.
- Client environment represented: HanTech. Visible brief explicitly names Metasploitable 2; its text also refers to two systems without identifying the second. Dev Guru is therefore not presumed in scope.
- Objective: identify five evidenced vulnerabilities, assess likelihood/impact/risk using CVE/CVSS where relevant, recommend controls, at least four GRC policies, cloud security fundamentals, executive summary, report and presentation.
- This is a vulnerability assessment, not an exploitation exercise. No exploitation or unauthorised third-party testing is permitted.
- Team reports must be original; shared evidence/research does not replace each member's independent submission.
- Current team allocation (7 Nov): Jeffrey — Tasks 1–2; Bonaventure — Tasks 3 & 8; Abundance — Task 4; Adeayo — Task 5; Amos Talks — Task 6; Task 7 Cloud Security unassigned.

## 2. Chronological process record

### 7 November 2026 — Governance, pre-flight and lab preparation
1. Created `CAPSTONE PROJECT 138` project workspace and governance/evidence directory structure. Created README, project charter, current status, live execution log, task-selection and action tracker.
2. Verified Desktop Commander endpoint `Phamous` online; host identity `PHAMOUS`, Windows user `CHINEDU`; Desktop Commander 0.3.1; Windows PowerShell 5.1.22621.4391.
3. Verified VirtualBox 7.2.10 and VBoxManage executable at `C:\Program Files\Oracle\VirtualBox\VBoxManage.exe`. Enumerated Kali Linux, Dev Guru and Metasploitable VMs.
4. Read-only inspection showed Metasploitable running/NAT at one inspection, Kali powered off or aborted/NAT, Dev Guru powered off/NAT. VM UUIDs and baseline snapshot details are in `20261107_PRECHECK_001_VirtualBox_ReadOnly.txt` and `PRECHECK_20261107_164618.txt`.
5. Recorded rollback snapshots named `CAPSTONE_PRECONFIG_20261107` for Kali and Metasploitable; exact snapshot UUIDs in `SNAPSHOT_BASELINE_20261107_164632.txt`. Existing `Snapshot 1` was also recorded.
6. Attempted to create a host-only adapter. VirtualBox returned `Could not find Host Interface Networking driver! Please reinstall` (`E_FAIL 0x80004005`). No driver installation was attempted.
7. After the host-only driver blocker, the approved alternative was VirtualBox Internal Network `CAPSTONE138_ISOLATED`, which isolates guest-to-guest traffic from the host and external networks. Dev Guru was left unchanged.
8. Initial VM startup and GUI issues were diagnosed. Evidence records show Kali startup failure `VERR_UNRESOLVED_ERROR` associated with host memory/pagefile pressure (Windows error 1455); resource settings were adjusted, then Kali successfully started. Metasploitable console/window focus, fullscreen, input and login were checked and documented.
9. Network validation was initially placed on HOLD while guest startup, interface addressing, ARP and route state were diagnosed. No vulnerability scan or exploitation was performed.

### 8 November 2026 — Guest addressing, DHCP and connectivity
1. Worked through Kali boot/recovery and network manager/interface checks. Captured screenshots for GRUB, root recovery shell, login, static/DHCP addressing, route, ARP and connectivity attempts.
2. Configured VirtualBox Internal Network `CAPSTONE138_ISOLATED` with Kali fixed DHCP mapping `192.168.138.10` and Metasploitable fixed mapping `192.168.138.20`; MAC mappings are preserved in the DHCP configuration and reservation receipts.
3. Corrected the DHCP pool/reservation configuration. Guest-side DHCP renewal was performed on Metasploitable; its screenshot shows `eth0` UP/RUNNING at `192.168.138.20/24`, MAC `08:00:27:f8:7d:a3`. The exact guest DHCP renewal command was not preserved in the retained text logs and is therefore not fabricated here.
4. Inspected VirtualBox DHCP server configuration, lease file and server log. DHCP log records ACK activity for `.20`; the lease file still contains the earlier `.100` record for Metasploitable MAC. DHCP lease-file consistency remains OPEN/HOLD.
5. Executed Kali → Metasploitable ping: 4 transmitted, 4 received, 0% loss. Screenshot preserved.
6. Executed Metasploitable → Kali ping: 4 transmitted, 4 received, 0% loss. Screenshot preserved.
7. Preserved DHCP config, lease and log copies, screenshots, SHA-256 hashes and a network validation receipt. No manual lease-file edits or DHCP service restart were performed.
8. No system discovery, vulnerability scanning or exploitation has started.

## 3. Verified lab identity and network state
| Item | Verified value |
|---|---|
| Host | PHAMOUS / CHINEDU |
| VirtualBox | 7.2.10 |
| Kali VM UUID | `8eefef2e-f9a7-44ed-bfda-cf280a9e0b6a` |
| Metasploitable VM UUID | `396b158d-852c-463f-b179-0cc971418cc7` |
| Dev Guru VM UUID | `a4e64a93-6c94-4342-a17a-56728cf15445` |
| Internal network | `CAPSTONE138_ISOLATED` |
| Kali address | `192.168.138.10` |
| Metasploitable address | `192.168.138.20/24` |
| Metasploitable MAC | `08:00:27:f8:7d:a3` |
| Connectivity | Bidirectional 4/4 ICMP replies, 0% loss |
| DHCP lease file | Stale `.100` record remains; reconciliation HOLD |
| Dev Guru | Powered off; original NAT configuration unchanged |

## 4. Exact command-line register
The companion `09_Evidence\COMMAND_LINE_REGISTER_EXTRACTED_20261108.csv` contains command-like lines extracted verbatim from retained `.txt` execution records, with source filename and line number. The sections below list the explicit commands directly visible in the retained current-session execution record.

### VirtualBox / Windows PowerShell commands executed in the current validation session
```powershell
Get-Process | Where-Object {$_.ProcessName -match 'VirtualBox|VBox'} | Select-Object ProcessName,Id,StartTime
Get-Command VBoxManage.exe -ErrorAction SilentlyContinue
& $v list vms
& $v list hostonlyifs
& $v list dhcpservers
& $v showvminfo 'Metasploitable' --machinereadable
& $v showvminfo 'Kali Linux' --machinereadable
ping.exe -n 2 -w 1000 192.168.138.20
ping.exe -n 2 -w 1000 192.168.138.10
Get-CimInstance Win32_Process -Filter "name='VBoxNetDHCP.exe'"
Test-NetConnection 192.168.138.10 -Port 22 -InformationLevel Detailed
Test-NetConnection 192.168.138.20 -Port 22 -InformationLevel Detailed
arp.exe -a
& $v guestproperty enumerate 'Kali Linux'
& $v guestproperty enumerate 'Metasploitable'
& $v controlvm 'Kali Linux' keyboardputscancode 1d 38 14 94 b8 9d
& $v controlvm 'Kali Linux' keyboardputstring 'ping -c 4 192.168.138.20'
& $v controlvm 'Kali Linux' keyboardputscancode 1c 9c
& $v controlvm 'Kali Linux' screenshotpng 'C:\Users\CHINEDU\Desktop\Kali_to_Metasploitable_Ping_20261108.png'
& $v controlvm 'Metasploitable' screenshotpng 'C:\Users\CHINEDU\Desktop\Metasploitable_Console_Before_Reverse_Ping_20261108.png'
& $v controlvm 'Metasploitable' keyboardputstring 'ping -c 4 192.168.138.10'
& $v controlvm 'Metasploitable' keyboardputscancode 1c 9c
& $v controlvm 'Metasploitable' screenshotpng 'C:\Users\CHINEDU\Desktop\Metasploitable_to_Kali_Ping_20261108.png'
Get-FileHash -Algorithm SHA256 <evidence-file>
Copy-Item -LiteralPath <source> -Destination <evidence-folder> -Force
Get-ChildItem <evidence-folder> -File | Get-FileHash -Algorithm SHA256
```

### Guest Linux commands visible in the screenshots
```bash
ifconfig eth0
route -n
ping -c 4 192.168.138.20
ping -c 4 192.168.138.10
ip neigh show 192.168.138.20
```
The guest-side DHCP renewal invocation, earlier Kali diagnostics/recovery keystrokes and any commands entered interactively but not captured in the saved text receipts remain to be transcribed from screenshots/terminal evidence where legible. No substitute commands are invented.

## 5. Visual evidence and screenshot control
- Screenshot inventory and SHA-256 manifest are in `09_Evidence\SHA256_EVIDENCE_MANIFEST_20261108.csv`.
- Original screenshots are preserved in `09_Evidence\00_Preflight` and `09_Evidence\01_Network_Configuration`.
- New bidirectional ping screenshots and the Metasploitable interface/route screenshot were copied into `01_Network_Configuration` during this audit.
- Evidence images are retained as PNG/JPG originals; do not replace them with cropped or redrawn versions. Any annotated derivatives must be additional files, not replacements.
- Use Snipping Tool or Fn+Windows+Print Screen for future visual captures; name consistently with task, result and timestamp.

## 6. Outstanding discrepancies and hold points
1. DHCP lease-file inconsistency: guest address and DHCP server ACK indicate `.20`, while the lease file retains `.100`. Preserve current evidence; do not edit the lease file or restart DHCP until the cause is understood.
2. No default gateway was visible in the Metasploitable `route -n` output. This is expected for an isolated guest-only network unless a gateway is deliberately configured; do not add one merely to make the output look complete.
3. The capstone brief refers to two systems but visibly names only Metasploitable 2. Keep Dev Guru out of scope pending instructor clarification.
4. Host-only adapter creation failed due missing VirtualBox Host Interface Networking driver. The project moved to Internal Network mode instead; do not describe the final topology as host-only.
5. System discovery and vulnerability scanning remain NOT STARTED. No findings are confirmed.

## 7. Task and project status
| Workstream | Owner / status |
|---|---|
| Tasks 1–2 | Jeffrey |
| Tasks 3 & 8 | Bonaventure |
| Task 4 | Abundance |
| Task 5 | Adeayo |
| Task 6 | Amos Talks |
| Task 7 Cloud Security | Unassigned |
| Lab network setup | Guest network and bidirectional reachability verified; DHCP lease-file reconciliation HOLD |
| System discovery | NOT STARTED |
| Vulnerability assessment | NOT STARTED |
| Risk assessment | Pending validated findings |
| Controls / GRC / cloud | Assigned workstreams; evidence integration pending |
| Final report / presentation | Pending |

## 8. Source evidence files
The source records in `09_Evidence` remain authoritative. Key records include:
- `20261107_PRECHECK_001_VirtualBox_ReadOnly.txt`
- `00_Preflight\PRECHECK_20261107_164618.txt`
- `00_Preflight\SNAPSHOT_BASELINE_20261107_164632.txt`
- `00_Preflight\HOSTONLY_CREATE_20261107_164644.txt`
- `01_Network_Configuration\INTERNAL_NETWORK_SETUP_20261107_164800.txt`
- `01_Network_Configuration\GUEST_START_20261107_164834.txt`
- `01_Network_Configuration\GUEST_NETWORK_STATUS_20261107_165525.txt`
- `01_Network_Configuration\INTERNAL_DHCP_SETUP_20261108_035727.txt`
- `01_Network_Configuration\INTERNAL_DHCP_POOL_CORRECTION_20261108_041547.txt`
- `01_Network_Configuration\INTERNAL_DHCP_METASPLOITABLE_FIXED_RESERVATION_20261108_041945.txt`
- `01_Network_Configuration\SCREENSHOT_Metasploitable_DHCP_Renew_Result_20261108_042139.png`
- `01_Network_Configuration\SCREENSHOT_Kali_to_Metasploitable_Ping_Bidirectional_20261108_042614.png`
- `01_Network_Configuration\SCREENSHOT_Metasploitable_to_Kali_Ping_Bidirectional_20261108_042645.png`
- `01_Network_Configuration\CAPSTONE138_ISOLATED-Dhcpd.config`
- `01_Network_Configuration\CAPSTONE138_ISOLATED-Dhcpd.leases`
- `01_Network_Configuration\CAPSTONE138_ISOLATED-Dhcpd.log`
- `01_Network_Configuration\NETWORK_VALIDATION_RECEIPT.txt`

## 9. Evidence integrity and audit rules
- Preserve source receipts, screenshots, DHCP files and logs unchanged.
- Record command, timestamp, host/guest, operator, output, screenshot and SHA-256 for each new action.
- Never infer a vulnerability from a candidate service name alone; verify service/version/configuration first.
- Do not scan beyond the authorised isolated target. Do not exploit.
- Do not promote a task from HOLD to PASS on a successful command alone; require the corresponding evidence and reconciliation.
- This document is a consolidated process audit, not a claim that the technical assessment is complete.

---
**Audit file generated:** 8 November 2026.
**Companion records:** `COMMAND_LINE_REGISTER_EXTRACTED_20261108.csv`; `SHA256_EVIDENCE_MANIFEST_20261108.csv`.


## 10. 8 November live identity correction and fresh VM screenshots

The user's primary Kali VM is **bonaventure@Whisper** (hostname Whisper, user onaventure), not kali@kali. The live screenshot confirms this identity. HanTech is the capstone client context; project configurations, screenshots, documentation and reports must describe the user's actual lab and HanTech scope.

Fresh screenshots were captured directly from the running VirtualBox VM displays and stored in  9_Evidence\01_Network_Configuration:
- LIVE_SCREENSHOT_Kali_bonaventure_Whisper_Validation_20261108_043604.png — SHA-256 FBAA4078A2550081ED8249333C67B974ED1FD4D9949F72D188B5FFA27BB839E1. Shows user/hostname, eth0 .10/24, and route. Multiple translucent terminals overlap; ping output is not accepted as clean fresh proof.
- LIVE_SCREENSHOT_Metasploitable2_Validation_20261108_043604.png — SHA-256 4705544E170DBA3CAD7F82EA06B1567C2884E43F6B84E2303C6C55DAC9BDBDFE. Shows hostname, msfadmin user, eth0 .20/24, route and successful 4/4 ping to Kali .10.

DHCP review confirms the issue remains open: the lease file contains .100; the server log shows client REQUEST ciaddr .100, fixed binding .20, ACK yiaddr .20. This is a mismatch between the client request/lease state and server's assigned address, not a resolved lease. Raw files remain unchanged. The live receipt HANTECH_LIVE_SYSTEM_IDENTITY_AND_SCREENSHOT_RECEIPT_20261108.txt records details and commands. System discovery remains NOT STARTED.


## 11. DHCP client process investigation — 8 November 2026

Read-only inspection of the live Metasploitable 2 guest found two DHCP client processes simultaneously: PID 4742 (dhclient3, configured with -pf /var/run/dhclient.eth0.pid -lf /var/lib/dhcp3/dhclient.eth0.leases eth0) and PID 4893 (dhclient eth0). The referenced /var/lib/dhcp3/dhclient.eth0.leases file does not exist; ls and cat returned No such file or directory. This is a plausible contributor to the stale .100 request / .20 ACK mismatch, but causation is not yet proven. No process was terminated and no guest file or DHCP service was changed. See  9_Evidence\01_Network_Configuration\DHCP_CLIENT_DIAGNOSTIC_FINDINGS_20261108.txt and screenshots with SHA-256 47AC21A9E2348D80B720D3AD22EC23506745F628F99BF5F803FEB4604D6A39D2 and 02F60D5244FF1ADBF7FF22ADC8C0007946F6AF5C7E852DD5431FB96570283EDA. Next action is read-only parent/service startup inspection. DHCP remains HOLD; scanning remains NOT STARTED.



## 12. Further DHCP startup inspection and live host precheck — 8 November 2026 05:14 WAT

A read-only host precheck confirmed that Kali Linux and Metasploitable remain running on VirtualBox Internal Network `CAPSTONE138_ISOLATED`, with adapter 1 set to `intnet` and the expected MAC addresses. The Windows host is `PHAMOUS` / `phamous\chinedu`. The project root remains `C:\Users\CHINEDU\Desktop\CAPSTONE PROJECT 138`.

A further live Metasploitable console screenshot was captured: `09_Evidence\01_Network_Configuration\LIVE_SCREENSHOT_Metasploitable_DHCP_Startup_ReadOnly_20261108_0514.png`, SHA-256 `324C712580E3A7ECFF33F82A6926D3C03069DD86B0CF5165D631F73BA1D179A7`. The visible read-only output shows `/etc/network/interfaces` configured with `auto eth0` and `iface eth0 inet dhcp`; `/etc/dhcp3` contains `dhclient.conf` and `dhclient.conf.dpkg-dist`; the attempted listing of DHCP init scripts and NetworkManager configuration returned no entries in the visible output. A `/var/run/dhclient.pid` file was listed, but its content was not established in this capture.

These observations do not yet identify which startup path launched each of the two DHCP clients. No process was stopped, no file was edited in the guest, and no service or network setting was changed. The two-client cause remains unconfirmed. The next step is to obtain a clean, bounded process/PID-file inspection; if the console command path is unreliable, preserve that limitation and use another read-only method rather than repeating potentially partial input.

The assessment remains at the DHCP verification gate. No system discovery or vulnerability scanning has been run. The guide's preferred host-only topology could not be created because the VirtualBox host-interface driver was unavailable; the current Internal Network is more isolated and connects the two VMs, but the host cannot directly join it. This deviation must remain explicit in methodology and must not be described as host-only.

## 13. Live DHCP process and PID-file attribution — 8 November 2026 05:19–05:20 WAT

A clean live guest-console capture confirms both DHCP clients have PPID 1. PID 4893 is dhclient eth0 and /var/run/dhclient.pid contains 4893. PID 4742 is dhclient3 with explicit -pf /var/run/dhclient.eth0.pid and -lf /var/lib/dhcp3/dhclient.eth0.leases arguments. The generic PID file therefore maps to PID 4893. The interface-specific PID file exists, but its contents were not read; the custom lease file specified by PID 4742 was absent in the earlier direct inspection. The separate /var/lib/dhcp3/dhclient.leases file exists and its live view shows eth0 fixed-address .20 entries.

A targeted read-only startup inspection found /etc/rcS.d/S40networking linked to ../init.d/networking. The captured grep of /etc/init.d/networking and /etc/network/if-up.d/* showed no dhclient invocation. This limited search does not establish that no other launcher exists. PPID 1 does not identify the original launcher. The source of PID 4742 and the origin of the earlier .100 DHCPREQUEST remain unresolved. Two concurrent clients are a credible explanation candidate, not proven causation.

New live screenshots and hashes:
- LIVE_SCREENSHOT_Metasploitable_DHCP_Process_Attribution_Clean_20261108_0523.png — SHA-256 E3401DBCE50174484A466BDDC53E6749F9B3BC653C52F5C65EE4761F843F0069.
- LIVE_SCREENSHOT_Metasploitable_DHCP_PID_Startup_20261108_0525.png — SHA-256 F23DCBA1D064A4EBEDC2A487BE24E1D28BEA0DDFFB2E937BB7085EC22316D1FC.
- LIVE_SCREENSHOT_Metasploitable_DHCP_LeaseAndStartup_20261108_0528.png — SHA-256 6F59D901FFEB4188B71F2F97BE29925F2E6554086EF356B9E5A1C5E84D7014E2.

No process was terminated, no guest file edited, no service restarted and no network setting changed. DHCP remains HOLD; discovery/scanning remains NOT STARTED.
## 14. DHCP PID-file and server-state refinement — 8 November 2026 05:22–05:24 WAT

New guest evidence confirms `/var/run/dhclient.eth0.pid` contains `4742`, mapping the interface-specific PID file to `dhclient3` PID 4742. The process command specifies `/var/lib/dhcp3/dhclient.eth0.leases`, which the same console check reports does not exist. Earlier evidence maps `/var/run/dhclient.pid` to PID 4893. Both processes have PPID 1. This does not establish their original launchers or justify terminating either process.

Read-only host inspection confirms the Metasploitable fixed reservation is .20 and Kali's is .10. The VirtualBox server log records an ACK with `ciaddr 192.168.138.100 yiaddr 192.168.138.20`. Correct interpretation: .100 is the ciaddr field (client current/previous address), while .20 is yiaddr (assigned address in this ACK). The server lease file still contains an acked .100 record for the Metasploitable MAC. This is a genuine inconsistency between the lease file and the fixed reservation/observed ACK, not proof that this ACK assigned .100. Raw config/log/lease files were read only and preserved.

New guest screenshot: `LIVE_SCREENSHOT_Metasploitable_DHCP_ClientSpecific_PID_Lease_Clean_20261108_0524.png` — SHA-256 `F5AD3037D256F126D874BDB449D1C1CF11A8B6DE35457E8DAFC4480FE53C5FF3`.
Host snapshot receipt: `09_Evidence\01_Network_Configuration\VIRTUALBOX_DHCP_SERVER_STATE_READONLY_20261108_052255.txt`.

DHCP remains HOLD. No process terminated, no host/guest DHCP file edited, no service restarted, no network configuration changed. System discovery/scanning remains NOT STARTED.
## Supplemental DHCP forensic-copy activity — 2026-11-08 05:31 Africa/Lagos
A live checkpoint `CAPSTONE_DHCP_FORENSIC_CHECKPOINT_20261108` (UUID `4a91e04b-799b-44c6-bc6b-a2429d1e8136`) was created on Metasploitable 2 while it remained running. The prior active differencing disk `5a72c11d-754d-4f03-8be9-956b61feb999` became read-locked; VirtualBox created active child `b30e247e-83fe-4180-b252-79e68fff75e1` for subsequent writes. The original `CAPSTONE_PRECONFIG_20261107` snapshot remains in the tree.
A standalone full VDI clone was successfully created from the read-locked checkpoint medium: `D:\VirtualBox VMs\CAPSTONE138_FORENSIC\Metasploitable_DHCP_Checkpoint_20261108.vdi`, UUID `173a33a1-325b-4804-897e-647e89fd9a87`, size 2,235,564,032 bytes, SHA-256 `76AD451FE4A342D0501FFE1B99A613D67A6FE8FDD1D9FB03D3B7C1E15790EB6B`, parent UUID `base`. The clone is not attached or booted.
Read-only filesystem inspection is presently blocked: WSL Ubuntu-24.04 cannot start because its configured `ext4.vhdx` is missing; no `vboximg-mount` binary is installed on the Windows host; qemu/libguestfs tools are absent; and `VBoxManage guestcontrol` reports Guest Additions not installed/ready. No disk was attached to Kali and no VM was powered off. See `09_Evidence\01_Network_Configuration\DHCP_READONLY_FORENSIC_COPY_RECEIPT_20261108.txt` for the detailed receipt.
DHCP process attribution and the `.100` VirtualBox lease discrepancy remain unresolved. The clone has not been mounted, so no disk-file contents are yet asserted. No DHCP process/configuration/lease/service/network setting was altered. DHCP remains HOLD; system discovery and vulnerability assessment remain NOT STARTED.

## DHCP offline filesystem attribution — 2026-11-08
A read-only offline examination of the standalone Metasploitable VDI clone succeeded using Ubuntu WSL, QEMU image conversion, Sleuth Kit, a read-only loop device, a read-only device-mapper root LV, and ext3 mount options `ro,noload`. The root filesystem was not repaired and its journal was not replayed. The evidence shows `/etc/network/interfaces` sets eth0 to DHCP; `/etc/init.d/networking` invokes `ifup -a`; `/etc/rcS.d/S40networking` links to that init script; and the installed ifupdown 0.6.8ubuntu8 binary contains a DHCP method template matching PID 4742's exact `dhclient3 -e IF_METRIC=100 -pf ... -lf ... eth0` command line. PID 4742 is therefore strongly attributable to the expected ifupdown startup path, although PPID 1 and absence of process accounting prevent direct proof of its original parent. PID 4893's generic `dhclient eth0` command does not match that method template; its origin remains unresolved.
The offline guest lease file contains repeated ACK entries for `.20`, and no `.100`; the interface-specific lease file is absent. `/var/run` is empty in the offline image, so live PID-file observations remain supported by the previously captured live screenshots only. The VirtualBox DHCP log confirms request `ciaddr .100`, fixed binding `.20`, and ACK `yiaddr .20`; its XML lease record still says `.100`. The cause of this server-side inconsistency remains unresolved. No DHCP process, guest configuration, server configuration, or lease file was changed. Detailed receipt: `09_Evidence\01_Network_Configuration\DHCP_OFFLINE_FILESYSTEM_ATTRIBUTION_20261108.txt`.
DHCP remains HOLD. No scanning has started.

## Forensic working-copy cleanup and integrity recheck — 2026-11-08
After offline filesystem inspection, the temporary raw derivative was detached from the read-only loop device and deleted to reclaim host storage. The standalone VDI clone remains preserved and a fresh post-cleanup SHA-256 check returned `76AD451FE4A342D0501FFE1B99A613D67A6FE8FDD1D9FB03D3B7C1E15790EB6B`. The original Metasploitable VM was rechecked as running on `CAPSTONE138_ISOLATED`. The offline attribution and remaining uncertainties are documented in `09_Evidence\01_Network_Configuration\DHCP_OFFLINE_FILESYSTEM_ATTRIBUTION_20261108.txt`.


## Approved DHCP correction — snapshot completed, execution blocked (2026-11-08)
Explicit user approval was received to gracefully terminate only PID 4893 while preserving PID 4742, subject to a fresh snapshot and rollback protection. Fresh snapshot CAPSTONE_DHCP_PRE_CORRECTION_20261108 was created and verified as current (UUID 975d0d1-b15f-440d-99d3-36b98e3de100). A fresh live guest query through VBoxManage guestcontrol failed because Guest Additions are not installed or ready (VBOX_E_GSTCTL_GUEST_ERROR 0x80bb000f). Since current process identity and PID reuse cannot be excluded, no process was terminated and no DHCP state was changed. Status remains HOLD / EXECUTION BLOCKED pending a reliable live guest command channel and revalidation. Receipt:  9_Evidence\01_Network_Configuration\DHCP_PRECORRECTION_APPROVAL_AND_EXECUTION_BLOCK_20261108.txt.



## Metasploitable console wake and DHCP correction status — 2026-11-08
The first VM screenshot was black. A single Enter key woke the guest display and exposed the existing msfadmin@metasploitable shell; no reboot or power-cycle occurred. Fresh live state confirmed PID 4742 (dhclient3 ifupdown method) and PID 4893 (dhclient eth0) both still running, with PID files 4742 and 4893 respectively. eth0 retained 192.168.138.20/24; route remained on 192.168.138.0/24; ping to Kali .10 succeeded 3/3 with 0% loss. An unprivileged attempt to terminate PID 4893 was denied. An interactive sudo prompt appeared; it was cancelled without entering a password or performing a privileged action. PID 4893 remains running and PID 4742 untouched. The console is now responsive. Await authorised local sudo authentication/root console to finish the already-approved graceful termination. DHCP remains HOLD; no scans started. Detailed receipt: 09_Evidence\01_Network_Configuration\METASPLOITABLE_CONSOLE_RECOVERY_AND_DHCP_CORRECTION_STATUS_20261108.txt.


## DHCP additional-client correction — process removed, network retained; overall gate HOLD (2026-11-08)
After the console was awakened, fresh live state again confirmed PID 4893 (`dhclient eth0`) and PID 4742 (`dhclient3` ifupdown method). The approved graceful termination was executed through the guest console using sudo. Independent `ps -p 4742,4893 -o pid,ppid,args` output showed PID 4742 only; PID 4893 was absent. PID 4742 remained. eth0 retained 192.168.138.20/24 and route 192.168.138.0/24; a fresh three-packet ping to Kali 192.168.138.10 succeeded 3/3 with 0% loss. The generic `/var/run/dhclient.pid` still contains stale value 4893; it was deliberately not edited. The client-specific PID file still contains 4742. No lease file, interface configuration, or VirtualBox DHCP server lease XML was edited; no service was restarted. The `.100` VirtualBox XML lease discrepancy remains unresolved; the overall DHCP gate remains HOLD pending its separate reconciliation and reverse-direction connectivity verification. No scanning started. Detailed receipt: `09_Evidence\01_Network_Configuration\DHCP_SINGLE_CLIENT_CORRECTION_RESULT_20261108.txt`.


## 14. Final Metasploitable DHCP correction and network gate — 8 November 2026, 06:02 WAT

The earlier black Metasploitable console display was recovered by sending a single Enter key through VirtualBox; the existing `msfadmin` shell appeared. No reboot or power-cycle was performed, and the framebuffer root cause is not asserted.

Following the approved pre-correction snapshot `CAPSTONE_DHCP_PRE_CORRECTION_20261108` (`f975d0d1-b15f-440d-99d3-36b98e3de100`), only the additional generic DHCP client PID 4893 was gracefully terminated. Fresh guest process checks show PID 4742 (`dhclient3`, the configured ifupdown DHCP method) remains and PID 4893 is absent. `/var/run/dhclient.eth0.pid` contains 4742. `/var/run/dhclient.pid` still contains 4893, a stale PID-file value intentionally preserved rather than edited. Metasploitable eth0 remains UP/RUNNING at `192.168.138.20/24`; Kali remains at `192.168.138.10/24`.

Post-correction connectivity was independently verified in both directions: Metasploitable → Kali `.10` returned 3/3 ICMP replies (0% loss); Kali → Metasploitable `.20` returned 4/4 (0% loss). Host-side read-only `VBoxManage dhcpserver findlease` identifies the old `.100` lease as **expired**, with TTL 0 seconds (issued 03:17:41Z, expired 03:27:41Z). The historical XML lease record was not modified/deleted. Later DHCP server log entries show Metasploitable request `ciaddr .20` and ACK `yiaddr .20`, consistent with its fixed reservation and guest address. No DHCP service restart or guest/host configuration edit occurred.

**Decision:** single-client correction PASS; guest addressing PASS; bidirectional network reachability PASS; historical `.100` lease state explained as EXPIRED and retained. Network readiness gate PASS for scoped system/service discovery of Metasploitable 2 at `192.168.138.20` only. This section does not report scan findings. Detailed final receipt: `09_Evidence\01_Network_Configuration\CAPSTONE138_DHCP_AND_BIDIRECTIONAL_NETWORK_FINAL_VERIFICATION_20261108.txt`.


## 15. Initial authorised TCP service discovery — 8 November 2026, 06:04 WAT

After the DHCP/network readiness gate passed, an initial TCP service/version discovery scan was run from Kali (`bonaventure@Whisper`) against the authorised Metasploitable 2 address `192.168.138.20` only. Kali Nmap version was 7.98. Exact command: `nmap -sV --version-light -T3 -oN /home/bonaventure/CAPSTONE138_METASPLOITABLE_TCP_DISCOVERY_20261108.txt 192.168.138.20`. The scan completed at 06:04:18 +0100 in 16.52 seconds; Nmap reported one host up, 23 open TCP ports and 977 closed TCP ports (reset) in its default top-1,000 TCP port set.

Open ports/service identifications are captured in `09_Evidence\02_System_Discovery\CAPSTONE138_INITIAL_TCP_SERVICE_DISCOVERY_20261108.txt` and live Kali screenshots. Notable Nmap banners include vsftpd 2.3.4 (21/tcp), OpenSSH 4.7p1 (22/tcp), Telnet (23/tcp), Apache 2.2.8 (80/tcp), Samba (139/445), ProFTPD 1.3.1 (2121/tcp), MySQL 5.0.51a (3306/tcp), PostgreSQL 8.3.x (5432/tcp), UnrealIRCd (6667/tcp), Apache JServ/AJP13 (8009/tcp), Tomcat (8180/tcp), and additional RPC, rsh/rlogin, Java RMI, VNC, X11 and bindshell service labels. Version-light fingerprints are preliminary inventory only; service/build/configuration must be validated before vulnerability classification. **No vulnerabilities are confirmed by this scan**, no CVEs/severities are assigned, and no NSE/vulnerability scripts, brute-force actions or exploit attempts were run. UDP scanning was not performed. Target scope remained Metasploitable 2 only.

Discovery result: initial TCP inventory PASS / COMPLETE. Next assessment step is controlled service-specific validation and corroboration of candidate exposures; do not treat Nmap banners alone as findings. The exact command and visual evidence are recorded in the companion receipt and command register.


## 16. Read-only service configuration validation and vulnerability research leads — 8 November 2026, 06:10 WAT

Additional non-invasive checks were completed from Kali against Metasploitable 2 only. HTTP 80 responded `200 OK` with `Apache/2.2.8 (Ubuntu) DAV/2` and `X-Powered-By: PHP/5.2.4-2ubuntu5.10`; HTTP 8180 responded `200 OK` with `Apache-Coyote/1.1`. The root page visibly warns against untrusted-network exposure, displays `msfadmin/msfadmin`, and links to TWiki, phpMyAdmin, Mutillidae, DVWA and WebDAV. No application login was attempted.

Unauthenticated SMB enumeration (`smbclient -L ... -N`) returned `Anonymous login successful` and listed `print$`, `tmp`, `opt`, `IPC$` and `ADMIN$`. A separate anonymous `tmp` share directory listing also succeeded. Only directory metadata was viewed; no files were read or modified.

NFS RPC enumeration showed NFS v2/v3/v4, mountd and lock manager services. `showmount -e` returned `/ *`. Read-only inspection of Metasploitable `/etc/exports` confirmed `/ *(rw,sync,no_root_squash,no_subtree_check)`: root filesystem path exported to wildcard clients, read/write, with root squashing disabled. This is a confirmed high-risk configuration weakness. No mount, remote file read/write, or privilege-impact test was attempted.

Package/config checks: `dpkg-query` confirmed Apache 2.2.8-1, OpenSSH 1:4.7p1-8ubuntu1, ProFTPD 1.3.1-6ubuntu1 and Samba 3.0.20-0.1ubuntu1. The HTTP header exposed PHP 5.2.4-2ubuntu5.10. The Samba config line 107 explicitly sets `username map script = /etc/samba/scripts/mksmbpasswd.sh`; the referenced script file was not present when checked. A package changelog grep found no `2447` match; that absence does not prove no backport.

CVE research: Samba upstream advisory identifies CVE-2007-2447 for Samba 3.0.0–3.0.25rc3 and the username map script prerequisite. The observed Samba version is inside that upstream affected range and the option is set, so this is a high-confidence candidate, not an exploited or fully patch-verified finding. No malicious username, MS-RPC trigger, authentication attempt or code-execution test was sent. The record also notes that vsftpd 2.3.4 CVE-2011-2523 is only applicable to the specific backdoored downloads in 2011-06-30 to 2011-07-03; banner evidence alone is insufficient.

Current preliminary evidence and remediation leads are recorded in `09_Evidence\02_System_Discovery\CAPSTONE138_SERVICE_CONFIGURATION_VALIDATION_20261108.txt` and `CAPSTONE138_PRELIMINARY_VULNERABILITY_CANDIDATES_20261108.txt`. Five distinct exposure categories have evidence, but findings still require scope-aware severity, patch/config applicability and final evidence grading. No exploitation, brute force, password submission, file write, NFS mount or vulnerability NSE scan occurred.


## 17. Evidence transcription correction — Samba script path and OS release — 8 November 2026

A visual transcription correction is required for Section 16 and the earlier service-validation addendum. The active `/etc/samba/smb.conf` line is `username map script = /etc/samba/scripts/mapusers.sh`. A read-only `ls -l` of that exact path confirms it exists, is executable, is owned by root:root and is zero bytes (`-rwxr-xr-x`, 0 bytes, timestamp 2010-04-28 02:41). The earlier `mksmbpasswd.sh` path was a misread and the check against it was the wrong filename. It must not be relied on to state that the configured script is missing. The corrected observation strengthens the CVE-2007-2447 configuration match; exploitability is still not tested and package patch status is not conclusively proven by an empty changelog search.

Read-only `/etc/lsb-release` confirms Ubuntu 8.04 Hardy. Ubuntu's CVE-2011-2523 page marks its official vsftpd package for Ubuntu 8.04 LTS as NOT AFFECTED. The live service banner says vsftpd 2.3.4, but package provenance is unknown; do not count CVE-2011-2523 from the banner alone.

Correction to the preceding section's final sentence: the evidence currently shows **six preliminary exposure categories** (NFS root export, Samba command-injection candidate, anonymous SMB access, disclosed default credentials, legacy remote protocols, and unsupported software). This is not a statement that six CVEs or six fully confirmed vulnerabilities have been established.


## 18. Five priority findings register and primary-source applicability review — 8 November 2026

Prepared `09_Evidence\02_System_Discovery\CAPSTONE138_FIVE_PRIORITY_FINDINGS_RISK_REGISTER_20261108.txt` as the preliminary evidence-led register for Task 3. The five priority items are: (1) NFS `/` export to wildcard clients with `rw,no_root_squash` (confirmed configuration weakness; remote mount/impact not tested); (2) Samba CVE-2007-2447 (high-confidence candidate because Samba 3.0.20 is inside upstream 3.0.0–3.0.25rc3 range and `username map script = /etc/samba/scripts/mapusers.sh` is active; exact patch state not proven, script is root-owned executable but zero bytes, and no trigger was sent); (3) anonymous SMB share listing and `tmp` directory metadata disclosure; (4) default lab credentials shown in HTTP root page (validity on remote services not tested); (5) unsupported Apache 2.2.8 / PHP 5.2.4 runtime (confirmed lifecycle exposure, no single CVE asserted). Telnet/rsh/rlogin listener exposure is retained as an additional hardening item, not used to inflate the five priority findings.

Primary-source research confirms Samba upstream's affected version range and username-map prerequisite; Ubuntu's CVE page explains the Samba command-injection conditions. Linux exports(5) documents root_squash as the default and no_root_squash as disabling it. Apache identifies httpd 2.2 as EOL and PHP states 5.2.16 ended support for PHP 5.2. Ubuntu lists its official Ubuntu 8.04 Hardy vsftpd package as NOT AFFECTED by CVE-2011-2523; this CVE is excluded because only a specially backdoored 2.3.4 download in a narrow 2011 date window is vulnerable and target binary provenance is unknown. References and qualitative risk ratings are included in the register.

No exploit, brute force, authentication test, NFS mount, remote SMB file read/write, upload or delete was performed. Findings reflect the Metasploitable lab target only, not HanTech production systems. The team must validate the actual in-scope HanTech systems independently before attributing any lab observation to the client.


## 19. Executive summary draft prepared — 8 November 2026

Prepared `09_Evidence\02_System_Discovery\CAPSTONE138_EXECUTIVE_SUMMARY_DRAFT_20261108.txt` for Task 8. It consolidates the isolated scope, DHCP/network readiness, initial Nmap inventory, five priority findings, key limitations and evidence paths. It expressly distinguishes the Metasploitable training environment from HanTech production systems and does not present candidate conditions as exploit-confirmed. The SHA-256 manifest was refreshed after recording the summary.


## 20. Metasploitable blank-console recurrence and Samba CVE-2007-2447 package review — 8 November 2026, approximately 06:33–06:36 WAT

### Console recurrence / recovery
Read-only VirtualBox inspection confirmed the Metasploitable VM remained RUNNING, attached to Internal Network CAPSTONE138_ISOLATED, with current snapshot CAPSTONE_DHCP_PRE_CORRECTION_20261108 (UUID f975d0d1-b15f-440d-99d3-36b98e3de100). A fresh VBoxManage screenshot was black. One Enter key scan code (1c 9c) was sent; the next screenshot displayed the existing msfadmin shell, previous Samba commands and a live prompt. No reboot, power-cycle, reset, snapshot restore or VM/network configuration change occurred. The display problem has recurred and was only temporarily redrawn; the root cause remains unknown and it is not marked permanently fixed.

### Samba local read-only validation
The live console was used for local package/configuration checks only. Observations:
- dpkg-query: samba status install ok installed; architecture i386; version 3.0.20-0.1ubuntu1; maintainer Eloy A. Paris <peloy@debian.org>.
- smbd -V: Version 3.0.20-Debian.
- /etc/samba/smb.conf line 107: active username map script = /etc/samba/scripts/mapusers.sh.
- The referenced mapusers.sh file exists, is owned by root:root, executable and zero bytes. SHA-256: e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855.
- dpkg -S attributes /usr/sbin/smbd to package samba. The local changelog query for "2447" returned no explicit match; this is not conclusive proof that the patch is absent.
- apt-cache policy: Installed 3.0.20-0.1ubuntu1; Candidate 3.0.28a-1ubuntu4.18 from Hardy updates/security repositories. The installed version appears only under /var/lib/dpkg/status and has no origin in the current APT package indexes.
- ps output showed root-owned smbd daemon processes running as /usr/sbin/smbd -D. Earlier system discovery independently recorded TCP 139/445 open and anonymous SMB share enumeration.

### CVE applicability conclusion
Samba upstream's CVE-2007-2447 advisory gives the affected upstream range as 3.0.0–3.0.25rc3 and describes unescaped MS-RPC input reaching /bin/sh when external scripts are invoked. The original SamrChangePassword vector applies when username map script is configured; other printer/file-share management vectors require authenticated sessions. The target's observed 3.0.20 version falls inside the upstream range and its username map script setting is active. The old installed package is below the Hardy repository candidate and lacks current APT origin metadata. This strengthens the applicability case, but does not conclusively prove whether the installed binary contains a vendor backport. Classification remains HIGH-CONFIDENCE CANDIDATE / PATCH STATUS OPEN / NOT EXPLOIT-CONFIRMED. The empty script does not prove the code path is safe. No malicious username, crafted MS-RPC request, authentication, exploit, brute force, SMB write, Samba service restart, package upgrade or configuration change was performed.

### Exact additional guest commands captured
```bash
dpkg-query -s samba | grep -E '^(Package|Status|Version|Source|Architecture|Maintainer):'
dpkg-query -s samba-common | grep -E '^(Package|Status|Version|Source|Architecture|Maintainer):'
smbd -V
grep -n 'username map script' /etc/samba/smb.conf
testparm -s 2>/dev/null | grep -i 'username map script'
stat -c '%A %U:%G %s bytes %y %n' /etc/samba/scripts/mapusers.sh
sha256sum /etc/samba/scripts/mapusers.sh
dpkg -S /usr/sbin/smbd
sha256sum /usr/sbin/smbd
zgrep -in '2447' /usr/share/doc/samba/changelog.Debian.gz
apt-cache policy samba
ps -ef | grep '[s]mbd'
```

### New visual evidence
- 09_Evidence\01_Network_Configuration\METASPLOITABLE_BLANK_CONSOLE_RECHECK_20261108.png — SHA-256 C435193D70710466ED90475FAF85CBFE33359148DBAF34DE72196D02CF404A68.
- 09_Evidence\01_Network_Configuration\METASPLOITABLE_CONSOLE_WAKE_RECHECK_20261108.png — SHA-256 3CDCD91DD09C6CC741CF08F3EF8EB159DC76E28D775F9251241BD1B4C5921D4A.
- 09_Evidence\02_System_Discovery\METASPLOITABLE_SAMBA_PACKAGE_PATCH_VALIDATION_RECHECK_20261108.png — SHA-256 DA440ACD95652ACAAFAAAD8F916FADD99B9D4F462C60ED36F8BA297035BC1665.
- 09_Evidence\02_System_Discovery\METASPLOITABLE_SAMBA_PATCH_AUDIT_POST_ENTER_20261108.png — SHA-256 D344A3D5CA48BEA0A801DE785CC1D82671303883534C77CE9B8F51749871314B.
- 09_Evidence\02_System_Discovery\METASPLOITABLE_SAMBA_PACKAGE_POLICY_RECHECK_20261108.png — SHA-256 A3C1D4851E7C8D00F2E7EED9368523C8AFA52DDD15D1D21E51DD706F795CA1BD.
- Detailed Samba review: 09_Evidence\02_System_Discovery\CAPSTONE138_SAMBA_CVE_2007_2447_APPLICABILITY_REVIEW_20261108.txt.



## 21. UnrealIRCd service-specific inventory and CVE-2010-2075 research lead — 8 November 2026, approximately 06:40–06:46 WAT

After completing the Samba CVE-2007-2447 applicability review, the next service-specific lead was TCP 6667, which the initial Nmap scan identified as IRC / UnrealIRCd.

Read-only guest process/listener checks showed PID 4640 (PPID 1), command /usr/bin/unrealircd, process owner root; netstat showed 0.0.0.0:6667 in LISTEN state. whereis returned /usr/bin/unrealircd. dpkg-query -W unrealircd returned no matching package. ls -l showed /usr/bin/unrealircd mode -rwx------, root:root, size 1,389,596 bytes and timestamp 2012-05-20 14:08. Unprivileged file/hash/strings attempts returned Permission denied. The legacy sudo binary rejected -n as an illegal option, so no privileged binary inspection was completed. No password was entered.

Common likely source/archive paths were checked with ls and were absent. A broader find command attempt failed with a shell syntax error; it did not constitute a completed search. A benign local IRC NICK/USER/VERSION/QUIT query produced only NOTICE AUTH hostname-resolution messages and no captured version response. Version remains UNKNOWN.

Official research for CVE-2010-2075 establishes that only certain trojanised UnrealIRCd 3.2.8.1 source archives distributed on mirrors between November 2009 and June 2010 are affected; the source marker is DEBUG3_DOLOG_SYSTEM in include/struct.h. The vendor advisory provides BAD archive MD5 752e46f2d873c1679fa99de3f52a274d and GOOD archive MD5 7b741e94e867c0a7370553fd01506c66. The local target does not currently provide the version, original source archive, mirror provenance, source marker or binary comparison needed to establish applicability. The binary's 2012 timestamp alone does not establish clean or backdoored provenance. Treat CVE-2010-2075 as a HIGH-PRIORITY VALIDATION LEAD only; do not add it to the five priority findings or claim it confirmed. Although the process listing showed root ownership, effective daemon credentials during hypothetical request handling were not tested.

No backdoor trigger, exploit payload, arbitrary command, malformed IRC input, authentication, file write, daemon restart, package update or configuration change was performed. The protocol query attempted only ordinary NICK/USER/VERSION/QUIT commands.

Detailed evidence: 09_Evidence\02_System_Discovery\CAPSTONE138_UNREALIRCD_CVE_2010_2075_APPLICABILITY_REVIEW_20261108.txt. New screenshots preserve process/listener, binary permission limitation, missing common source paths and unsuccessful version-query output.

References used:
- UnrealIRCd vendor advisory: https://forums.unrealircd.org/viewtopic.php?t=6562
- NVD CVE-2010-2075: https://nvd.nist.gov/vuln/detail/CVE-2010-2075
- Debian Security Tracker: https://security-tracker.debian.org/tracker/CVE-2010-2075


## 22. FTP service-specific inventory — ProFTPD TCP/2121 and vsftpd TCP/21 — 8 November 2026, approximately 05:45–05:52 WAT

Metasploitable remained running on CAPSTONE138_ISOLATED. A fresh VirtualBox screenshot showed the guest shell was available and included the FTP process/listener/configuration output. Read-only guest checks established two distinct services:
- TCP 21: listener 0.0.0.0:21; greeting-only connection to 127.0.0.1:21 returned 220 (vsFTPd 2.3.4), then 221 Goodbye.
- TCP 2121: listener :::2121; process PID 4530, PPID 1, user proftpd, command "proftpd: (accepting connections)"; /usr/sbin/proftpd -v returned ProFTPD Version 1.3.1; greeting-only connection to 127.0.0.1:2121 returned 220 ProFTPD 1.3.1 Server (Debian), then 221 Goodbye.

ProFTPD configuration read-only inspection showed ServerName Debian, Port 2121, User proftpd, Group nogroup, AllowOverwrite on and Include /etc/proftpd/modules.conf. No active DefaultRoot or active <Anonymous> directive was returned by the directive grep; the displayed anonymous section is a commented example. Do not claim anonymous ProFTPD access. AllowOverwrite on is a configuration-level permission but does not prove any user can authenticate or reach a writable path.

Research reviewed Debian Security Tracker CVE-2008-4242 (ProFTPD 1.3.1 long-command parsing / browser FTP-session CSRF scenario), CVE-2009-0542 (mod_sql percent-character SQL injection) and CVE-2009-0543 (NLS + mod_sql backend prerequisite). The version string matches the stated upstream 1.3.1 line, but the required client-side scenario, SQL modules, NLS support, SQL backend and Ubuntu package backport status are not established. Classify these only as conditional applicability leads, not confirmed vulnerabilities. Ubuntu 8.04 Hardy official vsftpd package is marked NOT AFFECTED by CVE-2011-2523; the port-21 banner alone does not establish the specially backdoored historical download. No trigger or port-6200 test occurred.

No USER/PASS, authentication, anonymous login, directory listing, file read/write, upload, overwrite, delete, malformed FTP command, exploit or vulnerability NSE scan was performed. No service restart, config/package change or VM reboot occurred. Only greeting capture followed by QUIT was used.

Detailed receipt: 09_Evidence\02_System_Discovery\CAPSTONE138_PROFTPD_1_3_1_SERVICE_REVIEW_20261108.txt. Screenshot evidence includes console/listener state, ProFTPD version/config directives, and distinct 21/2121 FTP greetings. The formatted dpkg-query status check did not print its intended fields because shell interpolation affected the format string; do not rely on that output as a successful package-status verification. Earlier package inventory recorded proftpd 1.3.1-6ubuntu1.


### ProFTPD module/package follow-up — 8 November 2026
A further read-only command checked dpkg package ownership, APT policy, the ProFTPD compiled-module list (`proftpd -l`), active `LoadModule` directives in `/etc/proftpd/modules.conf`, and module files under `/usr/lib/proftpd`. The captured screenshot shows module library files including mod_sql.so and mod_sql_mysql.so exist on disk. This does NOT establish that those modules are loaded or active in the running daemon, and does not establish an SQL backend or NLS support. The screenshot captures the tail of the output; detailed module activation remains unresolved. Do not upgrade CVE-2009-0542/0543 beyond conditional leads.
Evidence: `09_Evidence\02_System_Discovery\METASPLOITABLE_PROFTPD_MODULE_PATCH_REVIEW_20261108.png` — 17,170 bytes — SHA-256 455911682790A35FF2B01DDFC3FF9EA11D10B11AA800B417EC7BEBD0F80E1C71.

## 23. Telnet and Berkeley r-services exposure review — 8 November 2026, approximately 10:44–10:48 WAT

Read-only inspection of Metasploitable 2 (192.168.138.20) on CAPSTONE138_ISOLATED established TCP listeners bound to 0.0.0.0 on ports 23, 512, 513 and 514. /etc/inetd.conf contains active telnet, shell, login and exec service definitions, invoking tcpd and the in.telnetd / in.rshd / in.rlogind / in.rexecd handlers. Process inspection showed xinetd PID 4491 running as root. Package query showed telnetd 0.17-35ubuntu1 installed and xinetd 1:2.3.14-5 installed; openbsd-inetd 0.20050402-6 was deinstalled with config-files retained. No package record was found for inetutils-telnetd or netkit-rsh-server. The exact relationship between the xinetd process, inetd.conf entries and each listener was not independently established; do not attribute every socket to xinetd.

The /etc/xinetd.d inspection showed vsftpd, daytime, chargen and time service definitions; no telnet/rsh service file was identified in the captured grep output. /etc/hosts.equiv exists but displayed only commented example text. /root/.rhosts exists with mode 0700 and root:root ownership; read access as msfadmin was denied. Its contents and trust effect remain UNKNOWN.

Assessment: CONFIRMED INSECURE SERVICE EXPOSURE (TCP/23 Telnet and TCP/512–514 legacy Berkeley r-services), NOT a confirmed authentication bypass or exploitable remote-command vulnerability. No credentials, logins, rsh/rlogin/rexec requests, command execution, trust-file changes, service restart, package change or exploit was attempted. No reboot, power-cycle, reset or snapshot restore occurred.

Detailed receipt: 09_Evidence\02_System_Discovery\CAPSTONE138_TELNET_RSH_SERVICE_EXPOSURE_REVIEW_20261108.txt.
Screenshots: 09_Evidence\02_System_Discovery\METASPLOITABLE_TELNET_RSH_DISCOVERY_20261108.png; METASPLOITABLE_TELNET_RSH_DETAIL_20261108.png; METASPLOITABLE_TELNET_RSH_ACTIVE_STATE_20261108.png; METASPLOITABLE_TELNET_RSH_LISTENERS_20261108.png.

## 24. Tomcat 5.5.25 HTTP/AJP service review — 8 November 2026, approximately 10:49–10:51 WAT

Read-only inspection established listeners on 0.0.0.0:8180 and 0.0.0.0:8009. dpkg-query showed tomcat5.5 5.5.25-5ubuntu1.2 installed. Process inspection showed jsvc wrapper/processes PIDs 4584 and 4585 running as root and child PID 4587 running as tomcat55, with Catalina paths under /usr/share/tomcat5.5. /etc/tomcat5.5/server.xml contains uncommented HTTP Connector port=8180 and AJP/1.3 Connector port=8009 entries. The AJP connector line has no visible secret attribute. The listeners were independently confirmed bound to all IPv4 interfaces.

Classification: CONFIRMED LEGACY HTTP/AJP EXPOSURE; no specific CVE or exploitable impact confirmed. Do not infer CVE-2020-1938/Ghostcat applicability from AJP alone; Tomcat 5.5.25 is outside the commonly cited affected version ranges. Exact Ubuntu package patch/backport status and AJP access-control behavior remain open. No HTTP request, manager login, credential submission, AJP request, file inclusion/read, upload, deployment, exploit, vulnerability scan, service restart, package change or configuration edit occurred.

Detailed receipt: 09_Evidence\02_System_Discovery\CAPSTONE138_TOMCAT_5_5_AJP_8180_SERVICE_REVIEW_20261108.txt.
Screenshots: METASPLOITABLE_TOMCAT_AJP_REVIEW_20261108.png; METASPLOITABLE_TOMCAT_LISTENERS_20261108.png; METASPLOITABLE_TOMCAT_CONNECTOR_CONFIG_20261108.png.

## 25. Evidence manifest integrity closeout — 8 November 2026, approximately 10:52 WAT

Following the Telnet/Berkeley r-services and Tomcat HTTP/AJP evidence capture, the SHA256_EVIDENCE_MANIFEST_20261108.csv contains 279 records. Duplicate path count: 0. Full verification across all manifest rows returned 0 missing-file or hash-mismatch errors; the explicit ABSOLUTE: path entry was resolved against its actual drive path. The final manifest SHA-256 is reported in the handoff. It is intentionally not embedded in this audit because the audit file is itself hashed by the manifest. Any subsequent file edit requires another manifest refresh and verification.


## 26. Apache/PHP, WebDAV and web application discovery — 8 November 2026, approximately 10:57–11:04 WAT

Read-only local guest inspection and loopback HTTP HEAD/GET/OPTIONS checks were performed on Metasploitable 2. The response header was Apache/2.2.8 (Ubuntu) DAV/2 with X-Powered-By PHP/5.2.4-2ubuntu5.10. Installed packages included apache2 2.2.8-1, apache2.2-mpm-prefork and apache2.2-common 2.2.8-1ubuntu0.15. PHP packages php5-cgi, php5-cli, php5-common, php5-gd and php5-mysql were reported installed at 5.2.4-2ubuntu5.10. libapache2-mod-php5 was deinstall/config-files only and apache2ctl -M showed cgi_module, not php5_module in the captured filtered output; do not claim mod_php is active. Exact Ubuntu backport/CVE applicability remains open.

Loopback paths: /twiki/ HTTP 200 (782 bytes); /phpMyAdmin/ HTTP 200 (4,145 bytes); /mutillidae/ HTTP 200 (24,272 bytes); /dvwa/ HTTP 302 to login.php; /dav/ HTTP 200 (690 bytes, Index of /dav). dpkg-query returned no package records for the queried names twiki, phpmyadmin, mutillidae and dvwa; web-root directories exist. App-specific version identifiers were not reliably established. Presence of intentionally vulnerable training apps does not itself prove a vulnerability. No authentication or application testing was performed.

WebDAV configuration risk: dav_module, dav_fs_module and dav_lock_module loaded. Active /etc/apache2/sites-enabled/000-default lines 61–65 configure <Directory "/var/www/dav"> with Options Indexes MultiViews FollowSymLinks, AllowOverride None and DAV On. /var/www/dav is mode 1777, root:root. No auth directives were present in the captured DAV directory block. The endpoint returns HTTP 200 and an Index of /dav. A non-mutating OPTIONS request returned DAV: 1,2 and advertised DELETE, PROPPATCH, COPY, MOVE, LOCK and UNLOCK among its Allow methods (PUT was not present in the captured header). This is a HIGH-PRIORITY WEBDAV CONFIGURATION-RISK CANDIDATE; actual unauthenticated modification/deletion is NOT proven because no mutation method was attempted. Do not claim successful remote write/delete.

All requests in this pass were loopback-only from the target guest; Kali-to-target reachability was not freshly established. No credential, login, upload, file inclusion, SQL, XSS/CSRF test, file mutation, service restart, package/config change, reboot, power-cycle, reset or snapshot restore occurred.

Detailed receipt: 09_Evidence\02_System_Discovery\CAPSTONE138_APACHE_PHP_WEBDAV_WEBAPPS_REVIEW_20261108.txt.

## 27. Application-review evidence manifest closeout — 8 November 2026, approximately 11:05 WAT

Following the Apache/PHP, WebDAV and web application review, the manifest contains 291 records. Duplicate paths: 0. Full verification across every relative and ABSOLUTE: entry returned 0 missing-file or SHA-256 mismatch errors. The final manifest SHA-256 is reported in the handoff; it is not embedded here because this audit file is itself hashed by the manifest.

## 28. Apache/PHP package patch correlation and application release provenance — 8 November 2026, approximately 11:08–11:12 WAT

Read-only local package inventory confirmed apache2 2.2.8-1, apache2.2-common and apache2-mpm-prefork 2.2.8-1ubuntu0.15, and php5-cgi/php5-common/php5-mysql 5.2.4-2ubuntu5.10. libapache2-mod-php5 5.2.4-2ubuntu5.24 was deinstall/config-files only; cgi_module was shown active and php5_module was not shown in the captured filtered output. Prior OS release evidence identifies Ubuntu 8.04 Hardy.

Ubuntu USN-908-1 identifies Apache .15 as the Hardy fixed version for CVE-2010-0408 and CVE-2010-0434. Thus these are not considered unpatched on this evidence. Later Apache notices list .24 (USN-1627-1) and .25 (USN-1765-1) for subsequent issues; observed .15 is below those thresholds. Applicability depends on modules/conditions not yet established, so this remains a patch-gap lead, not a confirmed vulnerability.

Ubuntu USN-882-1 identifies PHP .10 as the Hardy fixed version for CVE-2009-4143, CVE-2009-4142 and CVE-2009-2626. Observed PHP .10 is therefore at that fixed baseline. USN-989-1 lists .12 for later PHP issues including CVE-2010-1917 and CVE-2010-2225; USN-1358-1 lists .22 for CVE-2012-0831. Observed .10 is below those revisions. CGI package/module presence is evidenced, but affected application function paths and request prerequisites remain unverified. Treat as conditional package-level leads only.

Application source-marker inspection did not establish a canonical product release for TWiki, phpMyAdmin, Mutillidae or DVWA. TWiki plugin API marker 1.010 and a date marker are not product version proof. phpMyAdmin PMA_VERSION references did not reveal a reliable definition. Mutillidae change-log.htm and installation.php were present but no reliable release identifier was established. DVWA README contains PHP compatibility text but no reliable release identifier. Prior dpkg-query found no matching TWiki/phpMyAdmin package records and no package record for Mutillidae/DVWA. Exact upstream archive, commit and checksum provenance remain unknown.

A follow-up dpkg-query Source/Maintainer command failed due shell quoting; its screenshot is retained as a failed query record and is not used as source-provenance proof. No package archive signature/hash or signed repository source was verified.

Detailed receipt: 09_Evidence\\02_System_Discovery\\CAPSTONE138_APACHE_PHP_UBUNTU_BACKPORT_REVIEW_20261108.txt.
Public vendor references recorded in the receipt: USN-882-1, USN-908-1, USN-989-1, USN-1358-1, USN-1627-1 and USN-1765-1.

## 29. Apache/PHP handler and CVE prerequisite review — 8 November 2026, approximately 11:14–11:22 WAT

Fresh read-only local inspection confirmed PHP CGI handler configuration in /etc/apache2/mods-enabled/php.conf: AddHandler php5-cgi .php and Action mappings to /cgi-bin/php5. The active vhost maps /cgi-bin; /usr/lib/cgi-bin/php5 is a root-owned executable and php-cgi is linked through alternatives. This supersedes the earlier statement that the handler mapping was unresolved.

Captured PHP CGI ini values include safe_mode Off, register_globals Off, magic_quotes_gpc Off, allow_url_fopen On and allow_url_include Off. Source grep across the four web application trees found no fnmatch() call and no SplObjectStorage reference. Generic unserialize() calls exist in bundled libraries, but no attacker-controlled serialized input or SplObjectStorage use was established. Therefore CVE-2010-1917, CVE-2010-2225 and CVE-2012-0831 are not promoted from the package version; CVE-2012-0831 in particular is not a bypass of an active magic_quotes_gpc control when that setting is already Off. F-08 is downgraded to package-level maintenance/patch-age lead only.

Relevant loaded Apache modules shown by apache2ctl -M: cgi, DAV/DAV-FS/DAV-lock, negotiation and status. The inspected loaded module list did not show mod_ssl, mod_proxy, mod_proxy_ajp, mod_proxy_balancer, mod_info, mod_imagemap or mod_proxy_ftp. No TCP/443 listener or Apache proxy/balancer configuration was shown. Tomcat's direct AJP listener on 8009 is not Apache mod_proxy_ajp.

status.conf has an active /server-status handler but Deny from all and Allow from localhost/ip6-localhost. Thus remote status access was not evidenced. mod_negotiation is loaded and MultiViews is configured in the previously reviewed DAV block, but CVE-2012-2687 requires untrusted uploads to a MultiViews-enabled location; unauthenticated upload remains unproven and no PUT or mutation was sent. CVE-2012-4929 lacks observed SSL module/listener prerequisites; CVE-2012-4557 and CVE-2012-4558 lack their proxy modules/configuration; CVE-2012-3499 is limited by the local-only status handler and absence of other cited modules. CVE-2013-1048 remains a local-only apache2ctl lock/symlink lead, not a remote HTTP finding; no symlink or privilege-escalation test was performed.

Detailed receipt: 09_Evidence\\02_System_Discovery\\CAPSTONE138_APACHE_PHP_HANDLER_AND_CVE_PREREQUISITE_REVIEW_20261108.txt.
Screenshots are preserved in the same evidence directory; hashes are embedded in the receipt.
No target state or configuration was changed.

## 30. CVE-2013-1048 lock-path state — 8 November 2026

The read-only local check showed /var/lock/apache2 exists as a regular directory, mode 0755, owner www-data:root. readlink returned no symlink target. /usr/sbin/apache2ctl lines 85–86 create /var/run/apache2 and install /var/lock/apache2 with APACHE2_RUN_USER (www-data). This does not test the CVE-2013-1048 symlink race or establish future recreation behavior. Keep it as a local-only package patch lead (installed Hardy .15 vs USN-1765-1 fixed .25), not a confirmed or remote finding. No symlink or privilege escalation was attempted.

## 31. Application configuration and sensitive-file review — 8 November 2026

Read-only local guest inspection continued with TWiki, phpMyAdmin, Mutillidae and DVWA. Operations included bounded `find`/directory metadata inspection, config-key presence checks (without printing secret values), Apache vhost/.htaccess review, and HTTP HEAD requests to loopback paths. No potentially sensitive HTTP response body was retrieved.

Key result: Mutillidae `/var/www/mutillidae/config.inc` is a 177-byte, www-data-owned file, mode 0755. Local checks found dbhost/dbuser/dbpass-related keys without revealing values. HEAD to `http://127.0.0.1/mutillidae/config.inc` returned HTTP 200, Content-Type text/plain, Content-Length 177. The inspected Mutillidae .htaccess only contains legacy PHP magic-quotes flags and no access-denial rule. This is a high-priority sensitive-configuration disclosure candidate (F-10); actual credentials were not retrieved and cross-VM remote access to this exact path remains to be independently checked.

phpMyAdmin's active config.inc.php was not found at the inspected path; default config.default.php sets cookie authentication and AllowNoPasswordRoot=false. DVWA config file exists mode 0644 and contains database setting keys, but values were not read; its .htaccess restricts GET/POST/PUT to localhost. TWiki data directory HEAD returned 403; no LocalSite.cfg/LocalLib.cfg was found at the inspected paths. Mutillidae setup-database.php and phpMyAdmin setup-frame path returned HTTP 200 text/html on HEAD; no setup operation was performed.

Screenshots: ten files listed in receipt `CAPSTONE138_WEB_APPLICATION_CONFIGURATION_AND_SENSITIVE_FILE_REVIEW_20261108.txt`. Detailed receipt: `09_Evidence\02_System_Discovery\CAPSTONE138_WEB_APPLICATION_CONFIGURATION_AND_SENSITIVE_FILE_REVIEW_20261108.txt`.

Safety: no login, credential submission, SQL, application setup/reset, HTTP GET of Mutillidae config.inc, upload, file mutation, exploit, scanner, package/configuration change, service restart, reboot, power-cycle, reset or snapshot restore occurred. All HTTP HEAD checks were to target loopback; remote Kali reachability of F-10 remains open.

## 32. Kali console input validation limitation — 8 November 2026

Kali was confirmed running and attached to CAPSTONE138_ISOLATED. The captured desktop showed prior failed ping/neighbor output, but it was not treated as fresh evidence. A harmless console input check showed that VirtualBox keyboard injection truncated the beginning of the intended echo command and the fragment returned command-not-found. Consequently, no valid fresh ping or HTTP HEAD request from Kali to /mutillidae/config.inc was executed. F-10 remote reachability remains unverified. Three diagnostic screenshots are preserved and hashed in the application review receipt/manifest. No VM, network or target configuration was changed.

## 33. F-10 independent Kali validation completed — 8 November 2026

Recovered the Kali console input path with short discrete VirtualBox keyboard injection. The short `id` command executed successfully, after which interface, route and test commands were issued individually and visually captured. Kali was running with eth0 UP, 192.168.138.10/24 and connected route 192.168.138.0/24 dev eth0. A fresh ping to 192.168.138.20 succeeded (1/1, 0% loss).

Issued a single HEAD-only request from Kali: `curl -sI --max-time 3 http://192.168.138.20/mutillidae/config.inc`. Response: HTTP/1.1 200 OK; Content-Length 177; Content-Type text/plain; Server Apache/2.2.8 (Ubuntu) DAV/2. This independently confirms remote reachability of the Mutillidae configuration resource over CAPSTONE138_ISOLATED and plain-text response metadata. No response body was retrieved. No database credentials were exposed, validated or submitted.

F-10 is upgraded from target-local candidate to confirmed remote HTTP resource exposure / sensitive-configuration disclosure risk at the resource-exposure level. Actual values, credential validity, database privileges and downstream impact remain unverified. No CVE assigned. Three screenshots and SHA-256 hashes are in receipt `CAPSTONE138_WEB_APPLICATION_CONFIGURATION_AND_SENSITIVE_FILE_REVIEW_20261108.txt`.

No VM/network setting, target file, service, package or application state was changed. No reboot, snapshot, credential test, SQL, setup action, upload, state-changing method, exploit or scanner was used.


## Documentation consolidation — 8 November 2026 (12:55 WAT)
This update records document preparation only; it does not represent a new scan or a change to any VM, network, target service or target configuration.

Created/updated workstream records:
- 03_System_Discovery/SYSTEM_DISCOVERY_AND_SERVICE_INVENTORY.md
- 03_System_Discovery/SERVICE_INVENTORY.csv
- 03_System_Discovery/DISCOVERY_EVIDENCE_INDEX.csv
- 04_Vulnerability_Assessment/VULNERABILITY_FINDINGS_REGISTER.md
- 04_Vulnerability_Assessment/CVE_APPLICABILITY_MATRIX.csv
- 05_Risk_Assessment/RISK_ASSESSMENT_AND_RISK_REGISTER.md
- 06_Security_Controls/SECURITY_CONTROL_MATRIX.md
- 07_GRC_Policies/GRC_POLICY_REGISTER_AND_DRAFTS.md
- 08_Cloud_Security/CLOUD_SECURITY_ASSESSMENT.md
- 10_Final_Report/EXECUTIVE_SUMMARY_DRAFT_20261108.md
- 10_Final_Report/FINAL_REPORT_STRUCTURE_AND_QA.md
- 11_Presentation/PRESENTATION_OUTLINE_AND_SPEAKER_NOTES.md

Governance updates:
- Recorded the 8 November 2026 task allocation in TASK_ALLOCATION_20261108.md and task_selection.csv.
- Updated PROJECT_CHARTER.md, action_tracker.csv and root README.md.
- Task 7 remains unassigned. The second-system scope question remains open.

Evidence restrictions retained:
- The five priority weaknesses are evidence-backed security configuration/access exposures, not five exploit-confirmed CVEs.
- Samba CVE-2007-2447 remains a high-confidence candidate pending exact package patch provenance.
- No live cloud tenant was assessed; cloud section is desk-based.
- No target changes, exploitation, authentication attempts, NFS mounting, SMB content access, WebDAV mutation or destructive tests were performed during this documentation consolidation.

Manifest handling: the pre-consolidation SHA-256 manifest is to be preserved in 99_Archive before the master manifest is regenerated to include these new workstream and governance files. Final manifest validation is a separate action and must be evidenced.


## Evidence manifest refresh and independent verification — 8 November 2026
- Preserved the pre-consolidation CSV at 99_Archive/02_Obsolete_Evidence_Indexes/SHA256_EVIDENCE_MANIFEST_PRE_WORKSTREAM_DOCS_20261108.csv.
- Rebuilt 09_Evidence/SHA256_EVIDENCE_MANIFEST_20261108.csv over current project files, excluding the active manifest itself and generated .dist folders.
- Initial full recomputation reported 367 records, zero duplicate path groups, zero missing paths and zero SHA-256 mismatches. The governance tracker/status were then updated and the full verification run again; final result is reported in the handoff.
- The manifest is a project-wide file-integrity index, not a proof that the technical claims are correct. Each claim remains tied to the relevant raw receipt/screenshot and stated limitations.

## 9 November 2026 — application-level discovery evidence reconciliation
- Reconciled the existing Apache/PHP, WebDAV, TWiki, phpMyAdmin, Mutillidae and DVWA read-only review receipts and screenshots.
- The 8 November Kali HEAD-only validation of Mutillidae /mutillidae/config.inc remains the only independently confirmed remote application-resource test in this review set; it returned 200, 177 bytes, text/plain. No body or credential value was retrieved.
- WebDAV remains a strong configuration-risk candidate (DAV enabled, directory listing, mode 1777, advertised DAV methods) but no state-changing method was tested; remote write/delete is not claimed.
- Apache/PHP package revisions and Ubuntu backport comparisons remain as documented in the 8 November vendor review. Exact .deb origin/signature/build provenance is unresolved; module and feature prerequisites exclude several proposed CVEs. No banner-derived CVE is promoted.
- TWiki, phpMyAdmin and DVWA are recorded as exposed application/path observations with the existing access-control and version limitations; no authentication, setup action or database access was attempted.
- On 9 November, a new Kali HEAD/OPTIONS sequence was attempted but host clipboard output was empty and the final screenshot showed no new HTTP results. The attempt is explicitly NOT VALIDATED and is not counted as executed testing.
- The Metasploitable console was black while the VM remained running. One previously approved Enter scancode woke the display and the existing shell prompt became visible. No reboot, reset, power-cycle, snapshot restore, service restart or target configuration change occurred.
- Evidence: CAPSTONE138_APPLICATION_LEVEL_DISCOVERY_REVIEW_20261109.txt; CAPSTONE138_APPLICATION_LEVEL_REMOTE_HEAD_ATTEMPT_NOT_VALIDATED_20261109.txt; METASPLOITABLE_CONSOLE_WAKE_RECHECK_20261109.png; KALI_APPLICATION_LEVEL_INPUT_PATH_DIAGNOSTIC_20261109.png.
- No finding ID, CVE or CVSS score changed. Project remains HOLD / DO NOT SUBMIT.

## 9 November 2026 — application review checkpoint and final recursive integrity verification
- Application-level evidence for Apache/PHP, WebDAV, TWiki, phpMyAdmin, Mutillidae and DVWA was reconciled. No new finding or CVE was promoted.
- Metasploitable's black console was awakened with one Enter scancode using the prior approved non-disruptive method; shell prompt became visible. No reboot, reset, power-cycle, restore, service restart or target configuration change.
- The Kali remote HEAD/OPTIONS attempt is explicitly not validated because no output was captured. Existing 8 November Mutillidae remote HEAD remains confirmed.
- Final full recursive project manifest refreshed after all application-review, audit, status, register and evidence-index updates: 1,528 records; zero duplicate path groups; zero missing paths; zero length/hash mismatches; SHA-256 sidecar match PASS.
- The 1,528 count includes the generated report-builder dependency tree under 10_Final_Report\_docgen\node_modules. The previous 478-record checkpoint is superseded.
- Project remains HOLD / DO NOT SUBMIT.
