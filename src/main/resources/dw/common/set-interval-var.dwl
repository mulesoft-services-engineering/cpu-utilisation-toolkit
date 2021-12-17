%dw 2.0
output application/java
---
if(!isEmpty(attributes.headers.'x-interval')) attributes.headers.'x-interval' as Number else p('anypoint.platform.apis.cloudhub.apps.interval')