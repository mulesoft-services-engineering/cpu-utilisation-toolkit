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
      "avgCPUusage": 0.0950188878313092
    },
    "design": {
      "totalVCores": 5,
      "allocatedVcores": 0,
      "avgCPUusage": 0
    },
    "startDatetime": "2022-01-13T13:24:01.935Z",
    "endDatetime": "2022-01-13T14:24:01.911Z"
  },
  "businessGroupLevelDetails": [
    {
      "businessGroupName": "MuleSoft Services Engineering",
      "businessGroupId": "cdcb397d-3d83-498f-b889-fb43a40ea8f6",
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
            "businessGroup": "cdcb397d-3d83-498f-b889-fb43a40ea8f6",
            "workerType": 0.1,
            "workerAmount": 1,
            "status": "STARTED",
            "averageCPUUtilisation": 2.3699719977482574,
            "endDate": "2022-01-13T14:24:01.911Z",
            "startDate": "2022-01-13T13:24:01.935Z"
          },
          {
            "application": "vcore-monitor-sandbox",
            "environment": "Sandbox",
            "environmentType": "Sandbox",
            "businessGroup": "cdcb397d-3d83-498f-b889-fb43a40ea8f6",
            "workerType": 0.1,
            "workerAmount": 1,
            "status": "STARTED",
            "averageCPUUtilisation": 0,
            "endDate": "2022-01-13T14:24:01.911Z",
            "startDate": "2022-01-13T13:24:01.935Z"
          },
          {
            "application": "vcore-metrics",
            "environment": "Sandbox",
            "environmentType": "Sandbox",
            "businessGroup": "cdcb397d-3d83-498f-b889-fb43a40ea8f6",
            "workerType": 0.1,
            "workerAmount": 1,
            "status": "STARTED",
            "averageCPUUtilisation": 2.3809723938172027,
            "endDate": "2022-01-13T14:24:01.911Z",
            "startDate": "2022-01-13T13:24:01.935Z"
          }
        ],
        "totalVCores": 5,
        "allocatedVcores": 0.3,
        "avgWeightedCpu": 0.0950188878313092
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