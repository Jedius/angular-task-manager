logger = require "./utils/logger"
mongoose = require "mongoose"
express = require 'express'
RedisStore = require("connect-redis")(express)

config = require "./config/config"
config.setEnvironment process.env.NODE_ENV or "development"


apps = require "./config/apps"
routes = require "./config/routes"
models = require "./config/models"
logCategory = "at: /app/index.coffee"

#setting up config env
app = express()
app.settings.env = process.env.NODE_ENV or "development"
app.port = config.PORT

dbconnection = require "./utils/dbconnect"
dbconnection.init (result) ->
  if result
    logger.info "Database initialized: " + result, logCategory

app.configure "production", "development", "test", ->
  config.setEnvironment app.settings.env
  console.log 'environment is: ', app.settings.env

module.exports = ->
  apps app
  routes app
  app

logger.info "--- Modules loaded into namespace ---", logCategory



