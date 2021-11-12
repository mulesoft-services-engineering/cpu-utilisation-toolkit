# CloudHub CPU Monitoring Framework - name TBC
The CloudHub CPU Monitoring Framework is a Mule application intended to collect, aggregate and report on CPU usage statistics for CloudHub deployed Mule applications. 

The framework is not an alternative to the Metrics Toolkit. Rather it serves a more specific funtion, monitoring CPU usage for each application and providing Business Group, Environment and application level information.

The framework is designed to be extensible and easily allow for adding additional reporting toolsets e.g. Splunk, ELK, Tableau etc. At present, only Anypoint Monitoring reporting has been implemented. 

### Disclaimer 
**This is an [UNLICENSED software, please review the considerations](UNLICENSE.md).** 
This application is provided by the MuleSoft Services Engineering team, it does not form part of the official MuleSoft product stack, and is therefore not included in MuleSoft support SLAs. Issues should be directed to the MuleSoft Services Engineering team, who will try to assist on a best endeavours basis. This application is distributed **as is**. 

# Features
The primary function of this tool is to capture the CPU usage metrics of CloudHub deployed apps on an on-demand or scheduled frequency, and load these metrics into a monitoring tool. 

A secondary function exists which allows for less frequent reporting of a summary of metrics. 

## On-Demand Loading
Capturing and or loading CPU usage metrics can be done as desired using the API implemented in this toolkit. The API specification included in the toolkit provides detailed request and response information. 


## Scheduled Loading
This schedule is designed to be run on a frequent basis e.g. every 30-60 minutes. It provides a snapshot of the CPU usage for all applications in the previous configured time period. Once metrics have been collected, they are pushed to the configured loading strategy e.g. Anypoint Monitoring Custom Metrics. 

If enabled, they are also stored in an Object Store v2 instance in order to facilitate Periodic Reporting as described below. 

## Periodic Reporting
Some organisations wish for a longer term view of CPU usage e.g. a once per month report. When this schedule is triggered, it reads all reports stored in an Object Store v2 instance, formats these into an Excel Spreadsheet, and emails this as an attachment to a previously configured list of email addresses. 

# Installation 

## Requirements
- Mule Runtime 4.3.0 or above
- The toolkit can be deployed on any Mule Runtime (CloudHub, RTF, On-Prem) but only collects metrics from CloudHub deployed applications
- Anypoint Platform credentials - Two options are supported:
  - Anypoint Platform user with the Organization Administrator role, and CloudHub Admin role. Both roles should be provided in the Master and all Sub Orgs for which you wish to gather data. The CloudHub Admin role is environment specific - therefore should be granted for each environment in each business group. 
  - A Connected App (client credentials) with the following scopes (make sure to include all Sub Orgs and all environments for which you want to collect data):
    - Runtime Manager
      - Cloudhub Network Viewer
      - Read Alerts
      - Read Applications
      - Read Servers
    - General
      - Profile
      - View Environment
      - View Organization

## Steps

1. Clone or download the project from GitHub `git clone https://github.com/mulesoft-services-engineering/vcore-monitor.git`

2. Adjust the properties, run the project and test it - go to your browser and open `http://localhost:8081/console/`

3. Use the postman collection provided (/postman) to understand the API. The postman collection contains the following requests: (TO DO)

4. If you want to run the application using the poller mode, you have to configure some properties

### Properties configurations

- Default configurations defined in `/src/main/resources/properties/app-{env}.yaml`:
- Make sure to encrypt all sensitive data using the Secure Properties Module: https://docs.mulesoft.com/mule-runtime/4.2/secure-configuration-properties.
- Default secure config file defined in `/src/main/resources/properties/secure/app-{env}.yaml`
- Example `mule.key` used and configured as a Global Property under `global.xml` file


Name | Description | Default Value
------------ | ------------ | ------------
http.port | The port for exposing the metrics-toolkit API | 8081


## Considerations



## Limitations


