%dw 2.0
import * from dw::core::Binaries
output application/java

var clientSecret = attributes.headers."x-anypnt-client-secret"
var password = attributes.headers."x-anypnt-password"
fun isBase64(text) = text matches(/^([A-Za-z0-9+]{4})*([A-Za-z0-9+]{3}=|[A-Za-z0-9+]{2}==)?$/)
fun getSecret(secret) = if (isBase64(secret default ""))
		fromBase64(secret) as String 
	else secret
---
if (!isEmpty(clientSecret))
	clientSecret
else 
	getSecret(password)