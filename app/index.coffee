logger = require "./utils/logger"

express = require 'express'
RedisStore = require("connect-redis")(express)

config = require "./config/config"
config.setEnvironment process.env.NODE_ENV or "development"


apps = require "./config/apps"
routes = require "./config/routes"

logCategory = "at: /app/index.coffee"

#setting up config env
app = express()
app.settings.env = process.env.NODE_ENV or "development"
app.port = config.PORT



app.configure "production", "development", "test", ->
  config.setEnvironment app.settings.env
  console.log 'environment is: ', app.settings.env
# all environments
module.exports = ->
  # Load Expressjs config
  apps app
  #  Load routes config
  routes app

  app

logger.info "--- Modules loaded into namespace ---", logCategory



