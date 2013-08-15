#Load dependencies
express = require "express"
config = require "./config"
redis_client = require("redis").createClient()
logger = require "../utils/logger"
fs = require "fs"
config.setEnvironment process.env.NODE_ENV || app.settings.env || "development"
logFrom = "app/config/apps.coffee"

RedisStore = require('connect-redis')(express);
redis = require("redis").createClient();
maxAges = 86400000 * 30

options = 
  host: config.REDIS_DB.host
  port: config.REDIS_DB.port
  ttl: maxAges

module.exports = (app) ->
  multipleRedisSessions = require("connect-multi-redis")(app, express.session)
  logger.info "Configure expressjs", logFrom
  
  app.configure ->
    @set("view options", {layout: false})
    .use(express.compress())
    .use(express.static(process.cwd() + "/public", {maxAge:maxAges}))
    # .use(express.static(process.cwd() + "/channel", {maxAge:maxAges}))
    .use(express.logger('dev'))
    .use(express.errorHandler(
          dumpException: true
          showStack: true
    ))
  # Set sessions and middleware
  
  app.configure ->
    @use(express.bodyParser())
    .use(express.methodOverride())
    .use(express.cookieParser('90dj7Q2nC53pFj2b0fa81a3f663fd64'))
    .use(express.session(
      store: new RedisStore(options)
      secret: 'f2e5a67d388ff2090dj7Q2nC53pF'
    ))
    .use (req, res, next) ->
        res.locals
                    
        next()

  app
