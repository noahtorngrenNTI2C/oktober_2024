require 'socket'
require_relative 'request'
require_relative 'router'

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

            # if result
            #   status = 200
            #   html = result[:block].call #<h1>gubbe!</h1>"
            # else
            #   status = 404
            #   html = "<h1>:(</h1>"
            # end
            # #Sen kolla om resursen (filen finns)


            # # Nedanstående bör göras i er Response-klass
            # #html = "<h1>Hello, World!</h1>"

            # session.print "HTTP/1.1 #{status}\r\n"
            # session.print "Content-Type: text/html\r\n"
            # session.print "\r\n"
            # session.print html
            # session.close
        end
    end
end

server = HTTPServer.new(4567)
server.start