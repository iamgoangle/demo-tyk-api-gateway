/* eslint-disable */
function toObject(data) {
  log('transforming data to object...')
  if (_.isEmpty(data)) {
    return {}
  }
  return JSON.parse(data)
}

function setBatchRequestObj(botID, mid) {
  log('creating batch request...')
  var apisUrl = {
    account: 'http://service-account:3001/api/v1/account-introduction',
    // bot_information: '/api/v1/bot-information',
    chatbot: 'http://service-chatbot:3004/api/v1/chatbot-introduction',
    commerce: 'http://service-commerce:3005/api/v1/commerces',
    coupon: 'http://service-coupon:3006/api/v1/coupon',
    // history: 'http://service-history:3007/api/v1/history',
    // photo: 'http://service-photo:3009/api/v1/photos',
    // recommendation: 'http://service-recommendation:3010/api/v1/recommendation',
    // recruitment: '/api/v1/recruit',
    // reward: 'http://service-reward:3012/api/v1/reward',
    // store_information: 'http://service-store-information:3013/api/v1/store-information',
    // timeline: 'http://service-timeline:3014/api/v1/timeline',
  }

  var requests = []
  for (api in apisUrl) {
    var _request = {
      method: 'GET',
      headers: {
        'X-BOT-ID': botID,
        'X-MID': mid,
      },
      body: '',
      relative_url: apisUrl[api],
    }

    requests.push(_request)
  }

  return requests
}

function lineAprAPIAggregator(request, session, config) {
  log('lineAprAPIAggregator')
  log(JSON.stringify(request))

  var botID = request['X-Bot-Id']
  var mid = request['X-Mid']

  log('botID')
  log(botID)

  log('mid')
  log(mid)

  // Set up a response object
  var response = {
    Body: '',
    Headers: {
      'content-type': 'application/json',
    },
    Code: 500,
  }

  // Setup batch request
  var batch = {
    requests: setBatchRequestObj(botID, mid),
    suppress_parallel_execution: false,
  }

  log('[Virtual Endpoint] Making Upstream Batch Request...')
  var newBody = TykBatchRequest(JSON.stringify(batch))

  // merging data
  var asJS = JSON.parse(newBody)
  for (var i in asJS) {
    asJS[i].body = toObject(asJS[i].body)
  }
  response.Body = JSON.stringify(asJS)

  return TykJsResponse(response, session.meta_data)
}
