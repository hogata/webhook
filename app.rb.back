# coding: utf-8
require 'rubygems'
require 'sinatra'
require 'json'
require 'net/http'
require 'uri'
#require 'text2voice'
require 'websocket-client-simple'

post '/webhook-handler' do

  event = JSON.parse(request.body.read)
  uri = URI.parse("https://hooks.slack.com/services/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")
  https = Net::HTTP.new(uri.host, uri.port)
  https.use_ssl = true
  req = Net::HTTP::Post.new(uri.request_uri)
  req["Content-Type"] = "application/json"
  payload = {
       "text" => event["eventName"]+"のステータスが"+event["status"]+"になりました."+event["message"],
       "username" => event["serviceName"] 
    }.to_json
  req.body = payload 
  res = https.request(req)

  ws = WebSocket::Client::Simple.connect 'ws://153.149.33.119:3000'

ws.on :message do |msg|
  puts msg.data
end

ws.on :open do
  ws.send 'hello!!!'
end

ws.on :close do |e|
  p e
  exit 1
end

loop do
  ws.send STDIN.gets.strip
end

   "OK"
end
