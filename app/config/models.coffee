mongoose = require("mongoose")
# require "express-mongoose"


#Exports
module.exports = ->
  
  #  Load Board model
  mongoose.model "angu", require("../models/angu")

