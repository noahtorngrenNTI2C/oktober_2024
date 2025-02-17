require_relative "lib/router"
require_relative "lib/tcp_server"
require 'slim'

router = Router.new
#router.add_route(:get, "/gubbe/") do # method ska vara en symbol
#  Slim::Template.new.("views/index.slim").render({username: "Olle"}) 
#end

server = HTTPServer.new(4567, router)
server.start
