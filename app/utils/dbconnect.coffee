config = require "../config/config"
config.setEnvironment "development"
logger = require "./logger"
mongoose = require "mongoose"
mongoose.set "debug", config.DEBUG_LOG

logCategory = "DATABASE Connection"

#DB_URL = config.MONGO_DB_URL

DB_URL = config.MONGO_DB_URL
mongourl = DB_URL
logger.info "MONGO DB URL: ", config.MONGO_DB_URL
db_connect_mongo = init: (callback) ->
  self = this
  mongo_options = db:
      safe: true
      #auto_reconnect: true
  mongoose.connect mongourl, mongo_options
  db = self.db_mongo = mongoose.connection

  db.on "error", (error) ->
    logger.error "ERROR connecting to: " + mongourl, logCategory
    callback error, null

  db.on "connected",  ->
    logger.info "SUCCESSFULLY connected to: " + mongourl, logCategory
    callback null, db

  db.on "disconnected", ->
    logger.info "DISCONNECTED from the database: " + mongourl, logCategory

# check and connect to Redis

exports = module.exports = db_connect_mongo