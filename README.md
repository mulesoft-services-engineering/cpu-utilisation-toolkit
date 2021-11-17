# CloudHub CPU Monitoring Framework - name TBC
The CloudHub CPU Monitoring Framework is a Mule application intended to collect, aggregate and report on CPU usage statistics for CloudHub deployed Mule applications. 

The framework is not an alternative to the [Metrics Toolkit](https://github.com/mulesoft-catalyst/metrics-toolkit/ "Metrics Toolkit"). Rather it serves a more specific funtion, monitoring CPU usage for each application and providing Business Group, Environment and application level information.

The framework is designed to be extensible and easily allow for adding additional reporting toolsets e.g. Splunk, ELK, Tableau etc. At present, only Anypoint Monitoring reporting has been implemented. 

### Disclaimer 
**This is an [UNLICENSED software, please review the considerations](UNLICENSE.md).** 
This application is provided by the MuleSoft Services Engineering team, it does not form part of the official MuleSoft product stack, and is therefore not included in MuleSoft support SLAs. Issues should be directed to the MuleSoft Services Engineering team, who will try to assist on a best endeavours basis. This application is distributed **as is**. 

# Features
The primary function of this tool is to capture the CPU usage metrics of CloudHub deployed apps on an on-demand or scheduled frequency, and load these metrics into a monitoring tool. 

A secondary function exists which allows for less frequent reporting of a summary of metrics. 

These functions are exposed in two ways, an API for realtime interactions, and two schedulers for polling operations. 

## API
The toolkit implements an API which allows consumers to retrieve a snapshot of CPU usage for a time period, to get the currently held CPU usage reports, to send this report via a configured publish method (email) or to delete the currently held reports. 

The API specification included in the toolkit provides detailed request and response information. 


## Poller - Metrics Loading
This schedule is designed to be run on a frequent basis e.g. every 30-60 minutes. It captures a snapshot of the CPU usage for all applications in the previous configured time period. Once metrics have been collected, they are pushed to the configured loading strategy e.g. Anypoint Monitoring Custom Metrics. 

If enabled, they are also stored in an Object Store v2 instance in order to facilitate Periodic Reporting as described below. 

![Flowchart](https://user-images.githubusercontent.com/58299919/142214828-7af0e41b-9c25-4c76-966c-a4022457d8a1.jpeg)

## Poller - Periodic Reporting
Some organisations wish for a longer term view of CPU usage e.g. a once per month report. When this schedule is triggered, it reads all reports stored in an Object Store v2 instance, formats these into an Excel Spreadsheet, and emails this as an attachment to a previously configured list of email addresses. As with the metric loading, reporting is designed to be extensible so any chosen method can be implemented and configured as needed. 

![Flowchart (1)](https://user-images.githubusercontent.com/58299919/142214849-c68fd22d-a490-436d-afb6-a13868bdb0ec.jpeg)

# Installation 

## Requirements
- Mule Runtime 4.3.0 or above
- The toolkit can be deployed on any Mule Runtime (CloudHub, RTF, On-Prem) but only collects metrics from CloudHub deployed applications
- Anypoint Platform credentials - Two options are supported:
  - Anypoint Platform user with the Organization Administrator role in each of the Business Groups you wish to gather metrics from. 
  - A Connected App (client credentials) with the following scopes (make sure to include all Sub Orgs and all environments for which you want to collect data):
    - Runtime Manager
      - Read Applications
    - General
      - Profile
      - View Organization

## Steps

1. Clone or download the project from GitHub `git clone https://github.com/mulesoft-services-engineering/vcore-monitor.git`

2. Adjust the properties, run the project and test it - go to your browser and open `http://localhost:8081/console/`

3. Use the postman collection provided (/postman) to understand the API. The postman collection contains the following requests: (TO DO)

4. If you want to run the application using the poller mode, you have to configure some properties

### Properties configurations

- Default configurations defined in `/src/main/resources/properties/config-{env}.yaml`:
- Make sure to encrypt all sensitive data using the Secure Properties Module: https://docs.mulesoft.com/mule-runtime/4.2/secure-configuration-properties.
- Default secure config file defined in `/src/main/resources/properties/config-secure-{env}.yaml`
- Example `mule.key` used and configured as a Global Property under `global.xml` file


Name | Description | Default Value
------------ | ------------ | ------------
http.{private}.port | The port for exposing the metrics-toolkit API over HTTP | 8081
https.{private}.port | The port for exposing the metrics-toolkit API over HTTPS | 8081
auth.mode |The authenctication mode to use for calling platform APIs | connected-app-credentials
poller.collector.enabled | Property to enable or disable the poller to collect metrics | true
poller.collector.cron | Defines the exact frequency (using cron-expressions) to trigger collector execution | 0 0 \* ? \* \*
poller.collector.timezone | Defines the time zone in which the cron-expression will be efective | GMT-3
poller.reporter.enabled | Property to enable or disable the poller for the summary report of metrics | true
poller.reporter.cron | Defines the exact frequency (using cron-expressions) to trigger collector execution | 0 0 0 1 \* ? \*
poller.reporter.timezone | Defines the time zone in which the cron-expression will be efective | GMT-3
auth.mode | Authentication mode. Valid options are: platform-credentials or connected-app-credentials | connected-app-credentials
auth.username | Anypoint Platform username. Used when auth.mode is platform-credentials |
auth.password | Anypoint Platform password. Used when auth.mode is platform-credentials |
auth.clientId | Anypoint Platform Connected App Client Id. Used when auth.mode is connected-app-credentials |
auth.clientSecret | Anypoint Platform Connected App Client Secret. Used when auth.mode is connected-app-credentials |
auth.orgId | Anypoint Platform master org Id |
ignoreLists.organizations | An array (comma-separated values) of Anypoint Platform sub-organizations id that will be ignored while retrieving metrics e.g "cdfa4e7d-47cd-n1h1-8f39-6a73fbb9ffcb, cdfa4e7d-47cd-n2h2-8f39-6a73fbb9ffcb" |
ignoreLists.environments | An array (comma-separated values) of environment ids that will be ignored while retrieving metrics e.g "cdfa4e7d-47cd-n1h1-8f39-6a73fbb9ffcb, cdfa4e7d-47cd-n2h2-8f39-6a73fbb9ffcb" |



## Considerations
### Calculation
The average summary CPU usage is calculated by: 
- Multiplying the CPU usage of an app, by the worker weight and the worker amount
- Taking the sum of each app usage in a business group by environment type (Production/Sandbox/Design) and dividing by the total number of cores available

`∑(cpu usage * worker weight * worker amount) / total number of cores`
So in the example below (4 \* 0.1 \*2 + 10\*2 + 27 \* 1) / 6 = 7.97 %

![image](https://user-images.githubusercontent.com/58299919/142185600-a55b813f-a59c-4260-8bbc-949b8254d3db.png)


## Limitations
The application only monitors CloudHub deployed applications and does not include RTF or on-prem applications in the calculations. 

