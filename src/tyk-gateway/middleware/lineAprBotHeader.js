/**
 * @author  Teerapong, Singthong
 * @todo  JSVM is interpreter in golang it's only support ES5 so please babel before.
 * @description To construct X-Bot-ID and X-MID and expose public to upstream request
 * @returns tyk middleware
 */

/* eslint-disable */
var lineArpBotHeader = new TykJS.TykMiddleware.NewMiddleware({})
lineArpBotHeader.NewProcessRequest(function(request, session) {
  log('Generating header...')
  log('lineArpBotHeader')
  log(JSON.stringify(request))

  var publicBotID = request['RequestURI'].substr(8)
  log('publicBotID')
  log(publicBotID)

  // TODO: Making request to example /api/v1/bot/{publicBotID}
  // get botid and mid to create new header

  // TODO call bot-service
  request.SetHeaders['X-Bot-ID'] = '1150'
  request.SetHeaders['X-MID'] = '5555'
  session['alias'] = 'Line Enginner Thailand'

  return lineArpBotHeader.ReturnData(request, session.meta_data)
})

log('Called: lineArpBotHeader middleware')
