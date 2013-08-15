fs = require "fs"
config = require "../config/config"
config.setEnvironment process.env.NODE_ENV or app.settings.env or "development"

Route = 
  index: (req, res) ->
    console.log("init index");
    index = fs.readFileSync "public/views/index.html",'utf8'
    res.end index

module.exports = Route
