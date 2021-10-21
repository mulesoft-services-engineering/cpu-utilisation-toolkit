%dw 2.0
output application/java
var datetime = if(!isEmpty(attributes.headers.'x-start-date')) attributes.headers.'x-start-date' as DateTime  else now() - |PT1H|
fun getFormattedDatetime(datetime)=(datetime >> "UTC") as String
---
getFormattedDatetime(datetime)