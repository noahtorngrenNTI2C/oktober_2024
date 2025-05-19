puts "start"

require_relative 'lib/main'

#router.add_route(:get, "/gubbe/") do # method ska vara en symbol
#  Slim::Template.new.("views/index.slim").render({username: "Olle"}) 
#end


#puts router
get("/test") do
  p "get test"
  hej = File.expand_path("html/hej.html")
  File.read("html/index.html") #("ruby .\test.rhtml")
end

get("/hej") do
  hej = File.expand_path("html/hej.html")
  File.read("html/hej.html")
end

#/add/1/2
#/add/4/5
get("/add/:num1/:num2") do |params|
  "<h1>#{params[0].to_i + params[1].to_i}</h1>"
end

#/users/3/pages/5
# -----   -----

get("/users/:user_id/pages/:page_id") do |params|
  "<h1>#{params[0].to_i + params[1].to_i}</h1>"
end

get("/brev") do
  File.read("html/brev.html")
end

post("/skicka") do |params|
  "senap"
end

@server.start