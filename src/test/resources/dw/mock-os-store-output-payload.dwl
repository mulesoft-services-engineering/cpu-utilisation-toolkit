output application/java 
---
{
  "summary": {
    "production": {
      "totalVCores": 5,
      "allocatedVcores": 0,
      "avgCPUusage": 0
    },
    "sandbox": {
      "totalVCores": 5,
      "allocatedVcores": 0.3,
      "avgCPUusage": 0.09510833666399286
    },
    "design": {
      "totalVCores": 5,
      "allocatedVcores": 0,
      "avgCPUusage": 0
    },
    "startDatetime": "2022-01-13T13:22:17.659Z",
    "endDatetime": "2022-01-13T14:22:17.637Z"
  },
  "businessGroupLevelDetails": [
    {
      "businessGroupName": "Fantasy Company",
      "businessGroupId": "877baaaa-36ba-4021-82d5-45bae78e0fe2",
      "production": {
        "applications": [],
        "totalVCores": 5,
        "allocatedVcores": 0,
        "avgWeightedCpu": 0
      },
      "sandbox": {
        "applications": [
          {
            "application": "cpu-usage-metrics",
            "environment": "Sandbox",
            "environmentType": "Sandbox",
            "businessGroup": "877baaaa-36ba-4021-82d5-45bae78e0fe2",
            "workerType": 0.1,
            "workerAmount": 1,
            "status": "STARTED",
            "averageCPUUtilisation": 2.372222203270712,
            "endDate": "2022-01-13T14:22:17.637Z",
            "startDate": "2022-01-13T13:22:17.659Z"
          },
          {
            "application": "vcore-monitor-sandbox",
            "environment": "Sandbox",
            "environmentType": "Sandbox",
            "businessGroup": "877baaaa-36ba-4021-82d5-45bae78e0fe2",
            "workerType": 0.1,
            "workerAmount": 1,
            "status": "STARTED",
            "averageCPUUtilisation": 0,
            "endDate": "2022-01-13T14:22:17.637Z",
            "startDate": "2022-01-13T13:22:17.659Z"
          },
          {
            "application": "vcore-metrics",
            "environment": "Sandbox",
            "environmentType": "Sandbox",
            "businessGroup": "877baaaa-36ba-4021-82d5-45bae78e0fe2",
            "workerType": 0.1,
            "workerAmount": 1,
            "status": "STARTED",
            "averageCPUUtilisation": 2.3831946299289313,
            "endDate": "2022-01-13T14:22:17.637Z",
            "startDate": "2022-01-13T13:22:17.659Z"
          }
        ],
        "totalVCores": 5,
        "allocatedVcores": 0.3,
        "avgWeightedCpu": 0.09510833666399286
      },
      "design": {
        "applications": [],
        "totalVCores": 5,
        "allocatedVcores": 0,
        "avgWeightedCpu": 0
      }
    }
  ]
}