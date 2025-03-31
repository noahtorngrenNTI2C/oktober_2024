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

get("/add/:num1/:num2") do |params|
  "<h1>#{params[0].to_i + params[1].to_i}</h1>"
end



@server.start