dheinaResponses = ['Dheina is my creator', 'Dheina is my boyfriend', 'Do you know dheina?', 'He\'s cute', 'He is my boss', 'He is my creator']

goodDayResponses = ['I\'m good', 'Very good', 'I\'m so good']

module.exports = (robot) ->

  robot.hear /how are you/i, (msg) ->
    msg.send msg.random	goodDayResponses

  robot.hear /dheina/i, (msg) ->
    msg.send msg.random dheinaResponses

  robot.hear /i love you/i, (msg) ->
    msg.send "I love you too"

  robot.hear /Do you have boyfriend/i, (msg) ->
    msg.send "Yes i have, his name is dheina"

  robot.hear /What is the best ecommerce/i, (msg) ->
    msg.send "11street.my"

  robot.hear /show me best (.*)/i, (msg) ->
  	productName = escape(msg.match[1])
  	msg.send "Searching #{productName} for you..."
  	msg.http("http://www.11street.my/totalsearch/TotalSearchAction/new/getProductSearchAjax.do?kwd=#{productName}")
      .get() (err, res, body) ->
       try
        json = JSON.parse(body)
        msg.send "Found #{json.totalCount} Products"
        msg.send "http://11street.my/totalsearch/TotalSearchAction/new/searchTotal.do?kwd=#{productName}"
       catch error
        msg.send "Gem not found. It will be mine. Oh yes. It will be mine. *sinister laugh*"


  