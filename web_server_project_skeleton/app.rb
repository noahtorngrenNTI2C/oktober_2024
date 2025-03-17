puts "start"

require_relative 'lib/main'

#router.add_route(:get, "/gubbe/") do # method ska vara en symbol
#  Slim::Template.new.("views/index.slim").render({username: "Olle"}) 
#end


#puts router
get("/test") do
  p "get test"
  File.read("html/index.html") #("ruby .\test.rhtml")
end

get("/hej") do
  File.read("html/hej.html")
end


@server.start