Angu = require "../models/angu"
config = require "../config/config"
logger = require "../utils/logger"

config.setEnvironment process.env.NODE_ENV or app.settings.env or "development"

Route = 

  list: (req, res) ->
    console.log("get board list");
    Angu.find {}, (err,boards) ->
      unless err
        res.send boards
      else
        console.log('error');

  create: (req,res) ->
    console.log('Create new board: ')
    console.log("body: ", req.body);
    Angu.create req.body, (err,board) ->
      unless err
        if board
          console.log(board);
          res.send board
        else
          res.send "board creation error"
      else
        res.send "board creation error"
 
  get: (req,res) ->
    Angu.findById req.params.id, (err, board) ->
      unless err
          if board 
            res.send board
             # logger.info "board remove", logFrom
          else
            # logger.error err, logFrom
            console.log('board not fond');
      else 
        console.log('error', err);
        
  delete: (req,res) ->
    Angu.findByIdAndRemove req.params.id, (err,ok)->
      unless err
        res.send
          message: 'dele'
      else
        res.send "board remove error"

  update: (req,res) ->
    Angu.findByIdAndUpdate req.params.id, {$set: req.body},(err,ok)->
      unless err
        res.send "success"
      else
        res.send "board update error"

module.exports = Route