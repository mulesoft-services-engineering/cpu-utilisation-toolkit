%dw 2.0
output application/java
fun getVcoreAllocation(vCoreAllocation) = 
    vCoreAllocation.assigned - vCoreAllocation.reassigned as Number default 0
---
{
    vCoresProduction: getVcoreAllocation(payload.entitlements.vCoresProduction),
    vCoresSandbox: getVcoreAllocation(payload.entitlements.vCoresSandbox),
    vCoresDesign: getVcoreAllocation(payload.entitlements.vCoresDesign)

}