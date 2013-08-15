
fs = require "fs"
config = require "../config/config"
config.setEnvironment process.env.NODE_ENV or app.settings.env or "development"

Pusher = require("pusher")





Route = 
  index: (req, res) ->
    console.log("init index");
    console.log("session: ",req.session);
    pusher = new Pusher(
      appId: config.APP_ID
      key: config.APP_KEY
      secret: config.APP_SECRET
    )
    pusher.trigger "my-channel", "my-event",
      message: "hello world"
    index = fs.readFileSync "public/views/index.html",'utf8'
    res.end index


module.exports = Route
