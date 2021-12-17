%dw 2.0
output application/json
var ignoredEnvironments = Mule::p('secure::ignoreLists.environments') splitBy ","

---
vars.environments.data filter ($."type" != "design") filter !(ignoredEnvironments contains  $.id)