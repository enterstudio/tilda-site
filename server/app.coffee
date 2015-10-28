###*
Main application file
###
'use strict'

# Set default node environment to development
process.env.NODE_ENV = process.env.NODE_ENV or 'development'

fs = require 'fs'
express = require 'express'
config = require './config/environment'

# Populate DB with sample data
require './config/seed'  if config.seedDB


cluster = require 'cluster'

if cluster.isMaster

  # Init pages on fly
  Page = require './api/page/page.model'
  Project = require './api/project/project.model'
  Project
  .initProject()
  .then (project) ->
    Page.initPages(project)
  .then () ->
    console.log 'All pages are ready ヽ(^ᴗ^)丿'
  .catch (err)->
    console.error err
    return

  threadCount = require('os').cpus().length
  for i in [1..threadCount]
    cluster.fork()

  cluster.on 'exit', (worker, code, signal)->
    console.log "Worker #{worker.process.pid} died."

    # Restart worker
    # if it's production
    # mode
    cluster.fork() if 'production' is env

else

  # Setup HTTP and HTTPS servers
  app = express()

  options =
    key: fs.readFileSync(config.ssl.key).toString()
    cert: fs.readFileSync(config.ssl.cert).toString()

  httpServer = require('http').createServer app
  httpsServer = require('https').createServer options, app

  require('./config/express') app
  require('./routes') app

  # Start HTTP server
  httpServer.listen config.http_port, ->
    console.log 'Express HTTP server listening on %d, in %s mode', config.http_port, app.get('env')

  # Start HTTPS server
  httpsServer.listen config.https_port, ->
    console.log 'Express HTTPS server listening on %d, in %s mode', config.https_port, app.get('env')



# Expose app
exports = module.exports = app
