
mongoose = require "mongoose"


Schema = mongoose.Schema


anguSchema = new Schema(
  path:
    type: String
    default: "url picture"
  name: 
      type: String
      default: "New name"
    
  info:
      type: String
      default: "New description"
   )

module.exports = mongoose.model 'angu', anguSchema

