# ================================================================================
# Teerapong Singthong - Notes
#
# Since we don't need to have key auth ofr each microservice so ignore this part
# However, if you want to have it, please update curl script 
# to be match with your upstream
#
# ================================================================================

curl -X POST -H "x-tyk-authorization: {API-SECRET}" \
  -s \
  -H "Content-Type: application/json" \
  -X POST \
  -d '{
    "allowance": 1000,
    "rate": 1000,
    "per": 1,
    "expires": -1,
    "quota_max": -1,
    "org_id": "1",
    "quota_renews": 1449051461,
    "quota_remaining": -1,
    "quota_renewal_rate": 60,
    "access_rights": {
      "{API-ID}": {
        "api_id": "{API-ID}",
        "api_name": "{API-NAME}",
        "versions": ["Default"]
      }
    },
    "meta_data": {}
  }' http://localhost:8080/tyk/keys/create | python -mjson.tool