
# Request Parameter validator does not fail requests with duplicate keys in payload

1. Create service (httpin)
2. Create route (/v1/data/KPIS/query)
3. Deploy plugin

curl -i -X POST http://localhost:8001/plugins --header "Content-Type: application/json" --header "kong-admin-token:admin" --data @17900.json  


{
"name": "request-validator",
"config": {
"body_schema": "{ \"type\": \"object\", \"properties\": { \"where\": { \"type\": \"object\", \"properties\": { \"kpiId\": { \"anyOf\": [ { \"maxLength\": 50, \"minLength\": 0, \"pattern\": \"[\\\\w\\\\.\\\\-]*$\", \"type\": \"string\", \"description\": \"Marquee unique KPI identifier.\" }, { \"maxItems\": 2, \"type\": \"array\", \"items\": { \"maxLength\": 50, \"minLength\": 0, \"pattern\": \"[\\\\w\\\\.\\\\-]*$\", \"type\": \"string\", \"description\": \"Marquee unique KPI identifier.\" } } ] } }, \"additionalProperties\": false } }, \"additionalProperties\": false }",
"version": "draft4",
"verbose_response": true,
"parameter_schema": null
}
}
 

4. Issue cURL command

curl -v -H "Content-Type: application/json" http://localhost:8000/v1/data/KPIS/query --data '{"where":{"kpiId":["Rowsconsumed", "Datatransferred", "APIQueryToDataService"],"kpiId":["Rowsconsumed","Datatransferred","APIQueryToDataService"]}}'
