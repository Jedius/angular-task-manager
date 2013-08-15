logger = require ("./utils/logger")
connect = require("connect")

logFrom = "at: /app/server.coffee" 

module.exports.start = ()->
 
  unless process.env.NODE_ENV?
    process.env.NODE_ENV = 'development'

  if process.env.NODE_ENV is 'test'
    init = require("./index")()
    port = init.port
    server = init.listen(port)
    logger.info("Server running at http://127.0.0.1: "+ port  + "\nPress CTRL-C to stop server. ")
  else  
    init = require("./index")()
    port = init.port
    logger.info("Server running at http://127.0.0.1: "+ port  + "\nPress CTRL-C to stop server. ")
    server = init.listen(port)  