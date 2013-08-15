#Slanger-node

#Setup
Before running this application we will need to setup some packages and couple of environmental settings

# First you need to install:
* [Redis-server](http://redis.io/topics/quickstart)
* [Node.js](nodejs.org)


  
Start redis server: 
    
    $redis-server

Start mongo server:
    
    $mongod

At the project root folder.
Install all packages:
    
    $npm i

    If you cannot install all packages then try to install this:
  * sudo apt-get install build-essential g++

Install global coffee-script:
   
    $npm install -g coffee-script

Run server:
    
    $npm start

 * [http://localhost:3000/](http://localhost:3000/)

In order not to add any private data within the code.

Here is a list, that is currently used add these to your .zschrc or .bashrc or .Profile :

    |------------------------------------------------------------------------|
    |  //set up development environment                                      |
    |------------------------------------------------------------------------|
    |  export NODE_ENV='development'                                         |
    |  export PORT=3000                                                      | 
    
    |------------------------------------------------------------------------|
    | 
    |------------------------------------------------------------------------|
    |  export VCAP_SERVICES=                                                 |
    |  { "mongodb-1.8":                                                      |
    |    [{"credentials: {                                                   |
    |       "username": null,                                                |
    |       "password": null,                                                |
    |        "hostname": "127.0.0.1",                                        |
    |        "port"    : 27017,                                              |
    |        "db"      : "eboard-mongo"                                      |
    |      }
    |    }]                                                                  |
    |  }, 
    |  {"redis-2.2":                                                         |
    |    [{
    |      "credentials": {
    |        "hostname": "localhost"                                         |
    |        "host": "127.0.0.1"
    |        "port": 6379                                                    |
    |        "name": "eboard-redis"
    |        "password": null                                                |
    |        "maxAge": 86400000 * 30
    |      }
    |    }]                                                                  |
    |   }                                                                    |
    |------------------------------------------------------------------------               
   
 