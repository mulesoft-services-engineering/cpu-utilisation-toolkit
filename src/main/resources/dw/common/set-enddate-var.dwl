%dw 2.0
output application/java
var datetime = if(!isEmpty(attributes.headers.'x-end-date')) attributes.headers.'x-end-date' as DateTime else now()
fun getFormattedDatetime(datetime)=(datetime >> "UTC") as String
---
getFormattedDatetime(datetime)