# Scope and Rules of Engagement — CAPSTONE PROJECT 138

## Objective
Evidence-led security assessment and recommendations for the HanTech capstone theme “From Vulnerability to Compliance: Securing Legacy and Cloud Systems”.

## Designated assessment environment
HanTech's designated assessment environment for this capstone is the Metasploitable 2 virtual machine at 192.168.138.20. Kali Linux at 192.168.138.10 is the assessment team's testing workstation. The guests communicate over VirtualBox Internal Network CAPSTONE138_ISOLATED. The environment is isolated from the host and external networks.

This designation defines the assessment environment for the capstone; it is not a representation that the VM is a production HanTech asset or that a separate production network was independently tested.

## Authorised technical target
Metasploitable 2 at 192.168.138.20 only, accessed from Kali at 192.168.138.10 over VirtualBox Internal Network CAPSTONE138_ISOLATED. Earlier project material refers to a second system, but no second target was identified in the available authorised scope. No substitute target, including Dev Guru, was scanned. No instructor dependency is assumed.

## Permitted work
Host/service discovery; read-only configuration review; benign HTTP HEAD requests; non-invasive protocol/service enumeration; public vendor-advisory research; evidence capture; and documented analysis within the isolated lab.

## Prohibited unless separately authorised
Exploitation; brute force; credential submission; password spraying; NFS mounting; remote file writes/deletes/uploads; state-changing HTTP methods; database access; destructive tests; testing external/public systems; and cloud tenant probing without explicit scope.

## Evidence handling
Preserve raw outputs and screenshots. Record command, timestamp, source/target, operator, result and SHA-256. Redact credentials/secrets. Never retrieve or reproduce secret values unnecessarily. Distinguish observed facts, inference and untested impact.

## Cloud assessment boundary
Task 7 is completed as a desk-based cloud-security baseline and evidence plan. No cloud provider, tenant, workload, account/subscription, region or authorised read-only identity was supplied; no live cloud assessment was performed.

## Reporting caveat
Findings are attributed to the designated isolated capstone assessment environment. Any conclusion about separate HanTech production systems requires separate written authorisation and actual asset, configuration, data-flow and control evidence.
