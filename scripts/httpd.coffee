# Description
#  make bot say message via httpd
#
# Dependencies:
#    qs, url
#
# Configuration:
#   None
#
# Commands:
#   "http://localhost:8080/say?room=roomname&message=somemessage"
#
# Notes:
#   None
#
# Author:
#   punchdrunker

url = require 'url'
qs = require 'qs'

module.exports = (robot) ->
    send = (room, msg) ->
        response = new robot.Response(robot, {user : {id : -1, name : room}, text : "none", done : false}, [])
        response.send msg
        # You can use notice after patch(add_notice.patch) like below.
        #response.send msg

    robot.router.get "/say", (req, res) ->
        prams = qs.parse(url.parse(req.url).query)
        message = prams.message
        room = '#' + prams.room
        send room, message
        res.end "1"
