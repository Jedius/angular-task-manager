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
  # error: ->
  #   new log.Logger(
  #     transports: [new log.transports.Console(
  #       level: "error"
  #       colorize: "true"
  #     ), new log.transports.File(filename: config.LOG_FILE)]
  #     exitOnError: false
  #   )
  # warn: ->
  #   new log.Logger(
  #     transports: [new log.transports.Console(
  #       level: "warn"
  #       colorize: "true"
  #     ), new log.transports.File(filename: config.LOG_FILE)]
  #     exitOnError: false
  #   )
module.exports = logger
  
