exports.setEnvironment = (env) ->
  boundServices = if process.env.VCAP_SERVICES then JSON.parse(process.env.VCAP_SERVICES) else null
  redisAddress = null
  switch(env)
    when "development"
      exports.PORT = process.env.PORT or 3000
      if boundServices?
        if boundServices["redis-2.2"][0]["credentials"]? 
          redisAddress = boundServices["redis-2.2"][0]["credentials"] 
      else
        redisAddress = 
          hostname: "localhost"
          host: "127.0.0.1"
          port: 6379
          name: "redis"
          password: null
          maxAge: 86400000 * 30

      exports.REDIS_DB = redisAddress
      exports.APP_ID = process.env.APP_ID || '50647' 
      exports.APP_KEY = process.env.APP_KEY || '9b67d007781875ec4344' 
      exports.APP_SECRET = process.env.APP_SECRET || '4a11f4bf36e409bfc4a1' 
      exports.LOG_FILE = './server.log'
      exports.PORT = process.env.PORT or 3000
      exports.APP = 
        name: "slanger"
        hostname: "localhost"
        host: "127.0.0.1"
      exports.DEBUG_LOG = true
      exports.DEBUG_WARN = true
      exports.DEBUG_ERROR = true
      exports.DEBUG_CLIENT = true
      exports.OPTIONS =
        api_host: '0.0.0.0'
        api_port: '4567'
        websocket_host: '0.0.0.0'
        websocket_port: '8080'
        debug: true
        redis_address: redisAddress.name+"://"+redisAddress.host+":"+redisAddress.port+'/0'

    when "test"
      exports.PORT = process.env.PORT or 3000
      exports.APP = process.env.VCAP_SERVICES["mongodb-1.8"][0]["credentials"] ||
        name: "slanger"
        hostname: "localhost"
        host: "127.0.0.1"
      exports.DEBUG_LOG = true
      exports.DEBUG_WARN = true
      exports.DEBUG_ERROR = true
      exports.DEBUG_CLIENT = true
      exports.REDIS_DB =
        hostname: "localhost"
        host: "127.0.0.1"
        port: 6379
        name: "redis"
        password: null
        maxAge: 86400000 * 30
      
    when "production"
      exports.PORT = process.env.PORT or 3000
      exports.APP =
        name: "slanger"
        hostname: "localhost"
        host: "127.0.0.1"
      exports.DEBUG_LOG = true
      exports.DEBUG_WARN = true
      exports.DEBUG_ERROR = true
      exports.DEBUG_CLIENT = true
      exports.REDIS_DB =
        hostname: "localhost"
        host: "127.0.0.1"
        port: 6379
        name: "redis"
        password: null
        maxAge: 86400000 * 30
      
    else
      console.log "environment #{env} not found"