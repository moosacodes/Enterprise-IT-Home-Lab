# Asset inventory schema

| Field | Description |
| --- | --- |
| DeviceID | Unique lab asset tag (e.g. DEV-W001) |
| AssetType | Workstation, Laptop, Printer, Monitor, Dock, etc. |
| Hostname | DNS / NetBIOS name |
| SerialNumber | Simulated serial |
| AssignedUser | sAMAccountName from AD |
| Department | Finance, HR, Sales, or IT |
| Location | Building / floor / remote site |
| Status | In Use, Spare, Retired |
| LastVerified | Last inventory check date |
| Notes | Free-text |

**Count:** 45 endpoints and peripherals (32 user endpoints + 13 peripherals).
