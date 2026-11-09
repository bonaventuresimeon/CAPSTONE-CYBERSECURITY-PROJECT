# Lab Topology and Scope Record
- Windows host: PHAMOUS.
- Kali VM: bonaventure@Whisper, 192.168.138.10/24.
- Metasploitable 2: 192.168.138.20/24.
- VirtualBox Internal Network: CAPSTONE138_ISOLATED.
- Connectivity: bidirectional ICMP passed after DHCP correction (Metasploitable→Kali 3/3; Kali→Metasploitable 4/4).
- Rollback snapshot: CAPSTONE_DHCP_PRE_CORRECTION_20261108, UUID f975d0d1-b15f-440d-99d3-36b98e3de100.
- Topology is an Internal Network, not host-only; host cannot directly join guest network through this topology.
- Dev Guru remains out of scope until the instructor identifies/authorises the second target.
- No bridged networking or external target testing.
Primary receipt: 09_Evidence/01_Network_Configuration/CAPSTONE138_DHCP_AND_BIDIRECTIONAL_NETWORK_FINAL_VERIFICATION_20261108.txt.
