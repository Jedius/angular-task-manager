#### Routes
fs = require 'fs'

index = require "../controllers/index"
angu = require "../controllers/angu"
module.exports = (app) ->
 
  app.get "/", (req,res,next)->
    console.log("ask for index");
    index.index req,res,next
  app.get "/angu/:id", (req,res,next)->
    angu.get req,res,next
  #to open angu
  app.put "/angu/:id", (req,res,next)->
    angu.update req,res,next
  #to delete angu
  app.delete "/angu/:id", (req,res,next)->
    angu.delete req,res,next
  #to create angu
  app.post "/angu", (req,res,next)->
    angu.create req,res,next
  #to view all of your boards
  app.get "/angu", (req,res,next)->
    angu.list req,res,next
  #end of angu routes-----------------