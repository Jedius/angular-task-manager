#Load dependencies
express = require "express"
config = require "./config"
redis_client = require("redis").createClient()
# RedisStore = require("connect-redis")(express)
logger = require "../utils/logger"
fs = require "fs"
config.setEnvironment process.env.NODE_ENV || app.settings.env || "development"
logFrom = "app/config/apps.coffee"



RedisStore = require('connect-redis')(express);

redis = require("redis").createClient();

# Options
# client  An existing redis client object you normally get from redis.createClient()
# host  Redis server hostname
# port    Redis server portno
# ttl     Redis session TTL in seconds
# db      Database index to use
# pass    Password for Redis authentication
# prefix  Key prefix defaulting to "sess:"
# ... Remaining options passed to the redis createClient() method.

maxAges = 86400000 * 30

options = 
  host: config.REDIS_DB.host
  port: config.REDIS_DB.port
  ttl: maxAges

# Redis session stores
# options =
#   hosts: [new RedisStore(
#     hostname: config.REDIS_DB.hostname
#     host: config.REDIS_DB.host
#     port: config.REDIS_DB.port
#     name: config.REDIS_DB.name
#     password: config.REDIS_DB.password
#     maxAge: 86400000 * 30 # 30 days
#   ), new RedisStore(
#     hostname: config.REDIS_DB.hostname
#     host: config.REDIS_DB.host
#     port: config.REDIS_DB.port
#     name: config.REDIS_DB.name
#     password: config.REDIS_DB.password
#     maxAge: 86400000 * 30 # 30 days
#   )]
#   session_secret: "f2e5a67d388ff2090dj7Q2nC53pF"
#   cookie:
#     maxAge: 86400000 * 1 # 30 days 

module.exports = (app) ->
  
  multipleRedisSessions = require("connect-multi-redis")(app, express.session)
  logger.info "Configure expressjs", logFrom
  
  #  Add template engine
  
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
    # .use(express.session(
    #   key: 'user.sid'
    #   store: options.hosts[0]
    #   secret: 'f2e5a67d388ff2090dj7Q2nC53pF'
    #   cookie:
    #     maxAge: 86400000 * 30     # 90 days
    # ))
    #Configure dynamic helpers
    .use (req, res, next) ->
        res.locals
                    
        next()

  app
