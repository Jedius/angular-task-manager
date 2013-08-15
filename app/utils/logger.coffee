config = require "../config/config"

config.setEnvironment process.env.NODE_ENV || "development"

log = require "winston"
log.addColors
    info: "blue"
    warn: "yellow"
    error: "red"
logger = 
  new log.Logger(
    transports: [new log.transports.Console(
      level: "info"
      colorize: "true"
    ), new log.transports.File(filename: config.LOG_FILE)]
    exitOnError: false
  )
 
module.exports = logger
  
