#### Routes


fs = require 'fs'

index = require "../controllers/index"
# channel = require ("../controllers/channel")

module.exports = (app) ->
 
  app.get "/", (req,res,next)->
    console.log("ask for index");
    index.index req,res,next

