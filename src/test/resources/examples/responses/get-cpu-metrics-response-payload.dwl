%dw 2.0
import * from dw::test::Asserts
---
payload must equalTo({
  "summary": {
    "production": {
      "totalVCores": 2,
      "allocatedVcores": 0.3,
      "avgCPUusage": 0.9379005316380471
    },
    "sandbox": {
      "totalVCores": 4,
      "allocatedVcores": 1.6,
      "avgCPUusage": 0.9630743456546764
    },
    "design": {
      "totalVCores": 4,
      "allocatedVcores": 0,
      "avgCPUusage": 0
    },
    "startDatetime": "2022-01-10T15:54:46.153Z",
    "endDatetime": "2022-01-10T16:54:46.139Z"
  },
  "businessGroupLevelDetails": [
    {
      "businessGroupName": "Fantasy Company",
      "businessGroupId": "877baaaa-36ba-4021-82d5-45bae78e0fe2",
      "production": {
        "applications": [
          {
            "application": "prd-sys-api",
            "environment": "Production",
            "environmentType": "Production",
            "businessGroup": "877baaaa-36ba-4021-82d5-45bae78e0fe2",
            "workerType": 0.1,
            "workerAmount": 3,
            "status": "STARTED",
            "averageCPUUtilisation": 6.252670210920314,
            "endDate": "2022-01-10T16:54:46.139Z",
            "startDate": "2022-01-10T15:54:46.153Z"
          }
        ],
        "totalVCores": 2,
        "allocatedVcores": 0.3,
        "avgWeightedCpu": 0.9379005316380471
      },
      "sandbox": {
        "applications": [
          {
            "application": "sandbox-proc-api",
            "environment": "Sandbox",
            "environmentType": "Sandbox",
            "businessGroup": "877baaaa-36ba-4021-82d5-45bae78e0fe2",
            "workerType": 0.2,
            "workerAmount": 1,
            "status": "STARTED",
            "averageCPUUtilisation": 1.9979140217131475,
            "endDate": "2022-01-10T16:54:46.139Z",
            "startDate": "2022-01-10T15:54:46.153Z"
          },
          {
            "application": "sandbox-sys-api",
            "environment": "Sandbox",
            "environmentType": "Sandbox",
            "businessGroup": "877baaaa-36ba-4021-82d5-45bae78e0fe2",
            "workerType": 0.1,
            "workerAmount": 1,
            "status": "STARTED",
            "averageCPUUtilisation": 2.173750824225389,
            "endDate": "2022-01-10T16:54:46.139Z",
            "startDate": "2022-01-10T15:54:46.153Z"
          }
        ],
        "totalVCores": 2.5,
        "allocatedVcores": 1.4,
        "avgWeightedCpu": 1.3361411772274665
      },
      "design": {
        "applications": [],
        "totalVCores": 2,
        "allocatedVcores": 0,
        "avgWeightedCpu": 0
      }
    }
  ]
})