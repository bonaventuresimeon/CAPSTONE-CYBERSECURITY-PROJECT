# Abundance Risk Assessment Integration
Owner: Abundance - Task 4
Status: INTEGRATED WORKING DRAFT - OWNER ACCEPTANCE PENDING
Source: 01_Risk_Register/RISK_ASSESSMENT_WORKING_20261108.md

Method retained from the owner's working draft:
- Likelihood: 1 Rare, 2 Unlikely, 3 Possible, 4 Likely, 5 Almost certain.
- Impact: 1 Insignificant, 2 Minor, 3 Moderate, 4 Major, 5 Severe.
- Score = likelihood x impact.
- Bands: 1-4 Low; 5-9 Moderate; 10-16 High; 17-25 Critical.

| Final ID | Source ID | L | I | Score | Rating |
|---|---|---:|---:|---:|---|
| FR-01 NFS root export | F-01 / R-01 | 4 | 5 | 20 | Critical |
| FR-02 Anonymous SMB | F-03 / R-03 | 4 | 2 | 8 | Moderate |
| FR-03 Mutillidae config exposure | F-10 / R-08 | 4 | 4 | 16 | High - provisional |
| FR-04 Public credential disclosure | F-04 / R-04 | 4 | 4 | 16 | High - provisional |
| FR-05 Telnet/r-services | F-06 / R-06 | 3 | 4 | 12 | High |

The short consolidated risk document used a different band for the Critical threshold. This integration uses Abundance's detailed Task 4 draft as the source of truth for the current working scores; the discrepancy must be resolved by Abundance before the report is signed off.

FR-03 and FR-04 impacts are conditional: the configuration body/secret values and the credential validity/privileges were not tested. HanTech asset criticality, data classification, production exposure, compensating controls, business impact, risk appetite, due dates and acceptance authority have not been supplied. Scores are provisional lab-based hypotheses, not owner-approved client risk.

CVSS is not the same as this qualitative business-risk score. No target-specific CVSS score is assigned to FR-01..FR-05. Abundance must approve/amend the ratings and record assumptions before Task 4 is marked accepted.
