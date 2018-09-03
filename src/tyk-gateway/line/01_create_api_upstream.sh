# ================================================================================
# Teerapong Singthong - Notes
#
# if we need to allow Authorization in header please add the following:
#
# "auth": {
#   "auth_header_name": "Authorization"
# },
# and the execute ./02_add_api_secret.sh to generate auth value for each upsteam
# ================================================================================

# ================================================================================
# aggregation api
# ================================================================================
curl -v -H "x-tyk-authorization: 9C8A37B53F3737D2FBA88C1E79E28" \
  -s \
  -H "Content-Type: application/json" \
  -X POST \
  -d '{
    "name": "service-aggregator",
    "slug": "service-aggregator",
    "api_id": "service-aggregator",
    "org_id": "line",
    "use_keyless": true,
    "definition": {
      "location": "header",
      "key": "x-api-version"
  	},
    "enable_context_vars": true,
    "version_data": {
      "not_versioned": true,
      "versions": {
        "Default": {
          "name": "Default",
          "use_extended_paths": true,
          "extended_paths": {
            "ignored": [],
            "white_list": [],
            "black_list": [],
            "virtual": [
              {
                "response_function_name": "lineAprAPIAggregator",
                "function_source_type": "file",
                "function_source_uri": "middleware/lineAprAPIAggregator.js",
                "path": "/",
                "method": "GET",
                "use_session": true
              }
            ]
          },
          "global_headers": {
            "X-Request-ID": "LINE-APR-$tyk_context.request_id"
          }
        }
    	}
    },
    "proxy": {
      "listen_path": "/api/v1/(*.)",
      "target_url": "http://localhost:8080/aggregator/",
      "strip_listen_path": true
    },
    "disable_quota": true,
    "custom_middleware": {
      "driver": "otto",
      "pre": [
        {
          "name": "lineArpBotHeader",
          "path": "middleware/lineAprBotHeader.js",
          "require_session": true
        }
      ],
      "post": [],
      "response": []
    },
    "cache_options": {
      "cache_timeout": 60,
      "enable_cache": true,
      "cache_all_safe_requests": false,
      "enable_upstream_cache_control": false
    },
    "session_lifetime": 0,
    "active": true
}' http://localhost:8080/tyk/apis/ | python -mjson.tool

echo "Added: service-aggregator \n"
# ================================================================================

# ================================================================================
# service-account-introduction
# ================================================================================
curl -v -H "x-tyk-authorization: 9C8A37B53F3737D2FBA88C1E79E28" \
  -s \
  -H "Content-Type: application/json" \
  -X POST \
  -d '{
    "name": "service-account-introduction",
    "slug": "service-account-introduction",
    "api_id": "service-account-introduction",
    "org_id": "line",
    "use_keyless": true,
    "auth": {
        "auth_header_name": ""
    },
    "definition": {
      "location": "header",
      "key": "x-api-version"
  	},
    "version_data": {
      "not_versioned": true,
      "versions": {
        "Default": {
          "name": "Default",
          "use_extended_paths": true,
          "extended_paths": {
            "ignored": [],
            "white_list": [],
            "black_list": [],
            "cache": ["get"],
            "transform": [],
            "transform_headers": [
              {
                "add_headers": {
                  "X-Service-ID": "service-account-introduction"
                },
                "path": "",
                "method": "GET"
              }
            ]
          },
          "global_headers": {
            "X-Request-ID": "LINE-APR-$tyk_context.request_id"
          }
        }
    	}
    },
    "proxy": {
      "listen_path": "/api/v1/account-introduction",
      "target_url": "http://service-account/api/v1/account-introduction",
      "strip_listen_path": true
    },
    "disable_quota": true,
    "custom_middleware": {
      "driver": "otto",
      "pre": [
        {
          "name": "lineArpBotHeader",
          "path": "middleware/lineAprBotHeader.js",
          "require_session": true
        }
      ],
      "post": [],
      "response": []
    },
    "cache_options": {
      "cache_timeout": 60,
      "enable_cache": true,
      "cache_all_safe_requests": false,
      "enable_upstream_cache_control": false
    },
    "session_lifetime": 0,
    "active": true
}' http://localhost:8080/tyk/apis/ | python -mjson.tool

echo "Added: service-account-introduction \n"
# ================================================================================

# ================================================================================
# service-bot-information
# ================================================================================
curl -v -H "x-tyk-authorization: 9C8A37B53F3737D2FBA88C1E79E28" \
  -s \
  -H "Content-Type: application/json" \
  -X POST \
  -d '{
    "name": "service-bot-information",
    "slug": "service-bot-information",
    "api_id": "service-bot-information",
    "org_id": "line",
    "use_keyless": true,
    "auth": {
        "auth_header_name": ""
    },
    "definition": {
      "location": "header",
      "key": "x-api-version"
  	},
    "version_data": {
      "not_versioned": true,
      "versions": {
        "Default": {
          "name": "Default",
          "use_extended_paths": true,
          "extended_paths": {
            "ignored": [],
            "white_list": [],
            "black_list": [],
            "cache": ["get"],
            "transform": [],
            "transform_headers": [
              {
                "add_headers": {
                  "X-Service-ID": "service-bot-information"
                },
                "path": "",
                "method": "GET"
              }
            ]
          },
          "global_headers": {
            "X-Request-ID": "LINE-APR-$tyk_context.request_id"
          }
        }
    	}
    },
    "proxy": {
      "listen_path": "/api/v1/bot-information",
      "target_url": "http://service-bot-information/api/v1/bot-information",
      "strip_listen_path": true
    },
    "disable_quota": true,
    "custom_middleware": {
      "driver": "otto",
      "pre": [
        {
          "name": "lineArpBotHeader",
          "path": "middleware/lineAprBotHeader.js",
          "require_session": true
        }
      ],
      "post": [],
      "response": []
    },
    "cache_options": {
      "cache_timeout": 60,
      "enable_cache": true,
      "cache_all_safe_requests": false,
      "enable_upstream_cache_control": false
    },
    "session_lifetime": 0,
    "active": true
}' http://localhost:8080/tyk/apis/ | python -mjson.tool

echo "Added: service-bot-information \n"
# ================================================================================

# ================================================================================
# service-chatbot
# ================================================================================
curl -v -H "x-tyk-authorization: 9C8A37B53F3737D2FBA88C1E79E28" \
  -s \
  -H "Content-Type: application/json" \
  -X POST \
  -d '{
    "name": "service-chatbot",
    "slug": "service-chatbot",
    "api_id": "service-chatbot",
    "org_id": "line",
    "use_keyless": true,
    "auth": {
        "auth_header_name": ""
    },
    "definition": {
      "location": "header",
      "key": "x-api-version"
  	},
    "version_data": {
      "not_versioned": true,
      "versions": {
        "Default": {
          "name": "Default",
          "use_extended_paths": true,
          "extended_paths": {
            "ignored": [],
            "white_list": [],
            "black_list": [],
            "cache": ["get"],
            "transform": [],
            "transform_headers": [
              {
                "add_headers": {
                  "X-Service-ID": "service-chatbot"
                },
                "path": "",
                "method": "GET"
              }
            ]
          },
          "global_headers": {
            "X-Request-ID": "LINE-APR-$tyk_context.request_id"
          }
        }
    	}
    },
    "proxy": {
      "listen_path": "/api/v1/chatbot-introduction",
      "target_url": "http://service-chatbot/api/v1/chatbot-introduction",
      "strip_listen_path": true
    },
    "disable_quota": true,
    "custom_middleware": {
      "driver": "otto",
      "pre": [
        {
          "name": "lineArpBotHeader",
          "path": "middleware/lineAprBotHeader.js",
          "require_session": true
        }
      ],
      "post": [],
      "response": []
    },
    "cache_options": {
      "cache_timeout": 60,
      "enable_cache": true,
      "cache_all_safe_requests": false,
      "enable_upstream_cache_control": false
    },
    "session_lifetime": 0,
    "active": true
}' http://localhost:8080/tyk/apis/ | python -mjson.tool

echo "Added: service-chatbot \n"
# ================================================================================

# ================================================================================
# service-commerce
# ================================================================================
curl -v -H "x-tyk-authorization: 9C8A37B53F3737D2FBA88C1E79E28" \
  -s \
  -H "Content-Type: application/json" \
  -X POST \
  -d '{
    "name": "service-commerces",
    "slug": "service-commerces",
    "api_id": "service-commerces",
    "org_id": "line",
    "use_keyless": true,
    "auth": {
        "auth_header_name": ""
    },
    "definition": {
      "location": "header",
      "key": "x-api-version"
  	},
    "version_data": {
      "not_versioned": true,
      "versions": {
        "Default": {
          "name": "Default",
          "use_extended_paths": true,
          "extended_paths": {
            "ignored": [],
            "white_list": [],
            "black_list": [],
            "cache": ["get"],
            "transform": [],
            "transform_headers": [
              {
                "add_headers": {
                  "X-Service-ID": "service-commerces"
                },
                "path": "",
                "method": "GET"
              }
            ]
          },
          "global_headers": {
            "X-Request-ID": "LINE-APR-$tyk_context.request_id"
          }
        }
    	}
    },
    "proxy": {
      "listen_path": "/api/v1/commerces",
      "target_url": "http://service-commerce/api/v1/commerces",
      "strip_listen_path": true
    },
    "disable_quota": true,
    "custom_middleware": {
      "driver": "otto",
      "pre": [
        {
          "name": "lineArpBotHeader",
          "path": "middleware/lineAprBotHeader.js",
          "require_session": true
        }
      ],
      "post": [],
      "response": []
    },
    "cache_options": {
      "cache_timeout": 60,
      "enable_cache": true,
      "cache_all_safe_requests": false,
      "enable_upstream_cache_control": false
    },
    "session_lifetime": 0,
    "active": true
}' http://localhost:8080/tyk/apis/ | python -mjson.tool

echo "Added: service-commerces \n"
# ================================================================================

# ================================================================================
# service-coupon
# ================================================================================
curl -v -H "x-tyk-authorization: 9C8A37B53F3737D2FBA88C1E79E28" \
  -s \
  -H "Content-Type: application/json" \
  -X POST \
  -d '{
    "name": "service-coupon",
    "slug": "service-coupon",
    "api_id": "service-coupon",
    "org_id": "line",
    "use_keyless": true,
    "auth": {
        "auth_header_name": ""
    },
    "definition": {
      "location": "header",
      "key": "x-api-version"
  	},
    "version_data": {
      "not_versioned": true,
      "versions": {
        "Default": {
          "name": "Default",
          "use_extended_paths": true,
          "extended_paths": {
            "ignored": [],
            "white_list": [],
            "black_list": [],
            "cache": ["get"],
            "transform": [],
            "transform_headers": [
              {
                "add_headers": {
                  "X-Service-ID": "service-coupon"
                },
                "path": "",
                "method": "GET"
              }
            ]
          },
          "global_headers": {
            "X-Request-ID": "LINE-APR-$tyk_context.request_id"
          }
        }
    	}
    },
    "proxy": {
      "listen_path": "/api/v1/coupon",
      "target_url": "http://service-coupon/api/v1/coupon",
      "strip_listen_path": true
    },
    "disable_quota": true,
    "custom_middleware": {
      "driver": "otto",
      "pre": [
        {
          "name": "lineArpBotHeader",
          "path": "middleware/lineAprBotHeader.js",
          "require_session": true
        }
      ],
      "post": [],
      "response": []
    },
    "cache_options": {
      "cache_timeout": 60,
      "enable_cache": true,
      "cache_all_safe_requests": false,
      "enable_upstream_cache_control": false
    },
    "session_lifetime": 0,
    "active": true
}' http://localhost:8080/tyk/apis/ | python -mjson.tool

echo "Added: service-coupon \n"
# ================================================================================

# ================================================================================
# service-history
# ================================================================================
curl -v -H "x-tyk-authorization: 9C8A37B53F3737D2FBA88C1E79E28" \
  -s \
  -H "Content-Type: application/json" \
  -X POST \
  -d '{
    "name": "service-history",
    "slug": "service-history",
    "api_id": "service-history",
    "org_id": "line",
    "use_keyless": true,
    "auth": {
        "auth_header_name": ""
    },
    "definition": {
      "location": "header",
      "key": "x-api-version"
  	},
    "version_data": {
      "not_versioned": true,
      "versions": {
        "Default": {
          "name": "Default",
          "use_extended_paths": true,
          "extended_paths": {
            "ignored": [],
            "white_list": [],
            "black_list": [],
            "cache": ["get"],
            "transform": [],
            "transform_headers": [
              {
                "add_headers": {
                  "X-Service-ID": "service-history"
                },
                "path": "",
                "method": "GET"
              }
            ]
          },
          "global_headers": {
            "X-Request-ID": "LINE-APR-$tyk_context.request_id"
          }
        }
    	}
    },
    "proxy": {
      "listen_path": "/api/v1/history",
      "target_url": "http://service-history/api/v1/history",
      "strip_listen_path": true
    },
    "disable_quota": true,
    "custom_middleware": {
      "driver": "otto",
      "pre": [
        {
          "name": "lineArpBotHeader",
          "path": "middleware/lineAprBotHeader.js",
          "require_session": true
        }
      ],
      "post": [],
      "response": []
    },
    "cache_options": {
      "cache_timeout": 60,
      "enable_cache": true,
      "cache_all_safe_requests": false,
      "enable_upstream_cache_control": false
    },
    "session_lifetime": 0,
    "active": true
}' http://localhost:8080/tyk/apis/ | python -mjson.tool

echo "Added: service-history \n"
# ================================================================================

# ================================================================================
# service-items
# ================================================================================
curl -v -H "x-tyk-authorization: 9C8A37B53F3737D2FBA88C1E79E28" \
  -s \
  -H "Content-Type: application/json" \
  -X POST \
  -d '{
    "name": "service-items",
    "slug": "service-items",
    "api_id": "service-items",
    "org_id": "line",
    "use_keyless": true,
    "auth": {
        "auth_header_name": ""
    },
    "definition": {
      "location": "header",
      "key": "x-api-version"
  	},
    "version_data": {
      "not_versioned": true,
      "versions": {
        "Default": {
          "name": "Default",
          "use_extended_paths": true,
          "extended_paths": {
            "ignored": [],
            "white_list": [],
            "black_list": [],
            "cache": ["get"],
            "transform": [],
            "transform_headers": [
              {
                "add_headers": {
                  "X-Service-ID": "service-items"
                },
                "path": "",
                "method": "GET"
              }
            ]
          },
          "global_headers": {
            "X-Request-ID": "LINE-APR-$tyk_context.request_id"
          }
        }
    	}
    },
    "proxy": {
      "listen_path": "/api/v1/items",
      "target_url": "http://service-item/api/v1/items",
      "strip_listen_path": true
    },
    "disable_quota": true,
    "custom_middleware": {
      "driver": "otto",
      "pre": [
        {
          "name": "lineArpBotHeader",
          "path": "middleware/lineAprBotHeader.js",
          "require_session": true
        }
      ],
      "post": [],
      "response": []
    },
    "cache_options": {
      "cache_timeout": 60,
      "enable_cache": true,
      "cache_all_safe_requests": false,
      "enable_upstream_cache_control": false
    },
    "session_lifetime": 0,
    "active": true
}' http://localhost:8080/tyk/apis/ | python -mjson.tool


echo "Added: service-items \n"
# ================================================================================

# ================================================================================
# service-photos
# ================================================================================
curl -v -H "x-tyk-authorization: 9C8A37B53F3737D2FBA88C1E79E28" \
  -s \
  -H "Content-Type: application/json" \
  -X POST \
  -d '{
    "name": "service-photos",
    "slug": "service-photos",
    "api_id": "service-photos",
    "org_id": "line",
    "use_keyless": true,
    "auth": {
        "auth_header_name": ""
    },
    "definition": {
      "location": "header",
      "key": "x-api-version"
  	},
    "version_data": {
      "not_versioned": true,
      "versions": {
        "Default": {
          "name": "Default",
          "use_extended_paths": true,
          "extended_paths": {
            "ignored": [],
            "white_list": [],
            "black_list": [],
            "cache": ["get"],
            "transform": [],
            "transform_headers": [
              {
                "add_headers": {
                  "X-Service-ID": "service-photos"
                },
                "path": "",
                "method": "GET"
              }
            ]
          },
          "global_headers": {
            "X-Request-ID": "LINE-APR-$tyk_context.request_id"
          }
        }
    	}
    },
    "proxy": {
      "listen_path": "/api/v1/photos",
      "target_url": "http://service-photo/api/v1/photos",
      "strip_listen_path": true
    },
    "disable_quota": true,
    "custom_middleware": {
      "driver": "otto",
      "pre": [
        {
          "name": "lineArpBotHeader",
          "path": "middleware/lineAprBotHeader.js",
          "require_session": true
        }
      ],
      "post": [],
      "response": []
    },
    "cache_options": {
      "cache_timeout": 60,
      "enable_cache": true,
      "cache_all_safe_requests": false,
      "enable_upstream_cache_control": false
    },
    "session_lifetime": 0,
    "active": true
}' http://localhost:8080/tyk/apis/ | python -mjson.tool

echo "Added: service-photos \n"
# ================================================================================

# ================================================================================
# service-recommendation
# ================================================================================
curl -v -H "x-tyk-authorization: 9C8A37B53F3737D2FBA88C1E79E28" \
  -s \
  -H "Content-Type: application/json" \
  -X POST \
  -d '{
    "name": "service-recommendation",
    "slug": "service-recommendation",
    "api_id": "service-recommendation",
    "org_id": "line",
    "use_keyless": true,
    "auth": {
        "auth_header_name": ""
    },
    "definition": {
      "location": "header",
      "key": "x-api-version"
  	},
    "version_data": {
      "not_versioned": true,
      "versions": {
        "Default": {
          "name": "Default",
          "use_extended_paths": true,
          "extended_paths": {
            "ignored": [],
            "white_list": [],
            "black_list": [],
            "cache": ["get"],
            "transform": [],
            "transform_headers": [
              {
                "add_headers": {
                  "X-Service-ID": "service-recommendation"
                },
                "path": "",
                "method": "GET"
              }
            ]
          },
          "global_headers": {
            "X-Request-ID": "LINE-APR-$tyk_context.request_id"
          }
        }
    	}
    },
    "proxy": {
      "listen_path": "/api/v1/recommendation",
      "target_url": "http://service-recommendation/api/v1/recommendation",
      "strip_listen_path": true
    },
    "disable_quota": true,
    "custom_middleware": {
      "driver": "otto",
      "pre": [
        {
          "name": "lineArpBotHeader",
          "path": "middleware/lineAprBotHeader.js",
          "require_session": true
        }
      ],
      "post": [],
      "response": []
    },
    "cache_options": {
      "cache_timeout": 60,
      "enable_cache": true,
      "cache_all_safe_requests": false,
      "enable_upstream_cache_control": false
    },
    "session_lifetime": 0,
    "active": true
}' http://localhost:8080/tyk/apis/ | python -mjson.tool

echo "Added: service-recommendation \n"
# ================================================================================

# ================================================================================
# service-reward
# ================================================================================
curl -v -H "x-tyk-authorization: 9C8A37B53F3737D2FBA88C1E79E28" \
  -s \
  -H "Content-Type: application/json" \
  -X POST \
  -d '{
    "name": "service-reward",
    "slug": "service-reward",
    "api_id": "service-reward",
    "org_id": "line",
    "use_keyless": true,
    "auth": {
        "auth_header_name": ""
    },
    "definition": {
      "location": "header",
      "key": "x-api-version"
  	},
    "version_data": {
      "not_versioned": true,
      "versions": {
        "Default": {
          "name": "Default",
          "use_extended_paths": true,
          "extended_paths": {
            "ignored": [],
            "white_list": [],
            "black_list": [],
            "cache": ["get"],
            "transform": [],
            "transform_headers": [
              {
                "add_headers": {
                  "X-Service-ID": "service-reward"
                },
                "path": "",
                "method": "GET"
              }
            ]
          },
          "global_headers": {
            "X-Request-ID": "LINE-APR-$tyk_context.request_id"
          }
        }
    	}
    },
    "proxy": {
      "listen_path": "/api/v1/reward",
      "target_url": "http://service-reward/api/v1/reward",
      "strip_listen_path": true
    },
    "disable_quota": true,
    "custom_middleware": {
      "driver": "otto",
      "pre": [
        {
          "name": "lineArpBotHeader",
          "path": "middleware/lineAprBotHeader.js",
          "require_session": true
        }
      ],
      "post": [],
      "response": []
    },
    "cache_options": {
      "cache_timeout": 60,
      "enable_cache": true,
      "cache_all_safe_requests": false,
      "enable_upstream_cache_control": false
    },
    "active": true
}' http://localhost:8080/tyk/apis/ | python -mjson.tool

echo "Added: service-reward \n"
# ================================================================================

# ================================================================================
# service-store-information
# ================================================================================
curl -v -H "x-tyk-authorization: 9C8A37B53F3737D2FBA88C1E79E28" \
  -s \
  -H "Content-Type: application/json" \
  -X POST \
  -d '{
    "name": "service-store-information",
    "slug": "service-store-information",
    "api_id": "service-store-information",
    "org_id": "line",
    "use_keyless": true,
    "auth": {
        "auth_header_name": ""
    },
    "definition": {
      "location": "header",
      "key": "x-api-version"
  	},
    "version_data": {
      "not_versioned": true,
      "versions": {
        "Default": {
          "name": "Default",
          "use_extended_paths": true,
          "extended_paths": {
            "ignored": [],
            "white_list": [],
            "black_list": [],
            "cache": ["get"],
            "transform": [],
            "transform_headers": [
              {
                "add_headers": {
                  "X-Service-ID": "service-store-information"
                },
                "path": "",
                "method": "GET"
              }
            ]
          },
          "global_headers": {
            "X-Request-ID": "LINE-APR-$tyk_context.request_id"
          }
        }
    	}
    },
    "proxy": {
      "listen_path": "/api/v1/store-information",
      "target_url": "http://service-store-information/api/v1/store-information",
      "strip_listen_path": true
    },
    "disable_quota": true,
    "custom_middleware": {
      "driver": "otto",
      "pre": [
        {
          "name": "lineArpBotHeader",
          "path": "middleware/lineAprBotHeader.js",
          "require_session": true
        }
      ],
      "post": [],
      "response": []
    },
    "cache_options": {
      "cache_timeout": 60,
      "enable_cache": true,
      "cache_all_safe_requests": false,
      "enable_upstream_cache_control": false
    },
    "active": true
}' http://localhost:8080/tyk/apis/ | python -mjson.tool

echo "Added: service-store-information \n"
# ================================================================================

# ================================================================================
# service-timeline
# ================================================================================
curl -v -H "x-tyk-authorization: 9C8A37B53F3737D2FBA88C1E79E28" \
  -s \
  -H "Content-Type: application/json" \
  -X POST \
  -d '{
    "name": "service-timeline",
    "slug": "service-timeline",
    "api_id": "service-timeline",
    "org_id": "line",
    "use_keyless": true,
    "auth": {
        "auth_header_name": ""
    },
    "definition": {
      "location": "header",
      "key": "x-api-version"
  	},
    "version_data": {
      "not_versioned": true,
      "versions": {
        "Default": {
          "name": "Default",
          "use_extended_paths": true,
          "extended_paths": {
            "ignored": [],
            "white_list": [],
            "black_list": [],
            "cache": ["get"],
            "transform": [],
            "transform_headers": [
              {
                "add_headers": {
                  "X-Service-ID": "service-timeline"
                },
                "path": "",
                "method": "GET"
              }
            ]
          },
          "global_headers": {
            "X-Request-ID": "LINE-APR-$tyk_context.request_id"
          }
        }
    	}
    },
    "proxy": {
      "listen_path": "/api/v1/timeline",
      "target_url": "http://service-timeline/api/v1/timeline",
      "strip_listen_path": true
    },
    "disable_quota": true,
    "custom_middleware": {
      "driver": "otto",
      "pre": [
        {
          "name": "lineArpBotHeader",
          "path": "middleware/lineAprBotHeader.js",
          "require_session": true
        }
      ],
      "post": [],
      "response": []
    },
    "cache_options": {
      "cache_timeout": 60,
      "enable_cache": true,
      "cache_all_safe_requests": false,
      "enable_upstream_cache_control": false
    },
    "active": true
}' http://localhost:8080/tyk/apis/ | python -mjson.tool

echo "Added: service-timeline \n"
# ================================================================================
