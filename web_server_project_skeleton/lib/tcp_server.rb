require 'socket'
require_relative 'request'
require_relative 'router'
require_relative 'response'

class HTTPServer

    def initialize(port)
        @port = port
    end

    def start
        server = TCPServer.new(@port)
        puts "Listening on #{@port}"
        router = Router.new
        router.add_route(:get, "/gubbe/") do # method ska vara en symbol
            "<h1> Weee </h1>"
        end

        while session = server.accept
            data = ""
            while line = session.gets and line !~ /^\s*$/
                data += line
            end
            puts "RECEIVED REQUEST"
            puts "-" * 40
            puts data
            puts "-" * 40 

            #
            request = Request.new(data)            


            result = router.match_route(request)


            response = Response.new(result, session)
            response.send

        end
    end
end

server = HTTPServer.new(4567)
server.start