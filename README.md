Table of Contents
=================

   * [Table of Contents](#table-of-contents)
   * [vCore Monitoring Framework](#vCore-Monitoring-Framework---name-TBC)


# vCore Monitoring Framework - name TBC
The vCore Monitoring Framework is a Mule application intended to collect, aggregate and report on CPU usage statistics for CloudHub deployed applications. 

The framework is not an alternative to the Metrics Toolkit. Rather it serves a more specific funtion, monitoring CPU usage for each application and providing Business Group, Environment and application level information.

The framework is designed to be extensible and easily allow for adding additional reporting toolsets e.g. Splunk, ELK, Tableau etc. At present, only Anypoint Monitoring reporting has been implemented. 

## Reporting Schedules
There are two different reporting schedules implemented

Frequent/Regular/Hourly
This schedule is designed to be run on a frequent basis e.g. every 30-60 minutes. It provides a snapshot of the CPU usage for all applications in the previous configured time period. Once metrics have been collected, they are (if enabled) stored in an Object Store v2 instance in order to facilitate less frequent overall reporting as described below. 

Periodic/Monthly Overall report 
Some organisations wish for a longer term view of CPU usage e.g. a once per month report. When this schedule is triggered, it reads all reports stored in an Object Store v2 instance, formats these into an Excel Spreadsheet, and emails this as an attachment to a previously configured list of email addresses. 
