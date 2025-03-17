require 'socket'
require_relative 'request'
require_relative 'router'
require_relative 'response'

class HTTPServer

    def initialize(port, router)
        @port = port
        @router = router
    end

    def start()
        server = TCPServer.new(@port)
        puts "Listening on #{@port}"
        
        #router = Router.new
        #router.add_route(:get, "/gubbe/") do # method ska vara en symbol
        #    "<h1> Weee </h1>"
        #end

        while session = server.accept
            data = ""
            while line = session.gets and line !~ /^\s*$/
                data += line
            end
            puts "RECEIVED REQUEST"
            puts "-" * 40
            puts data
            puts "-" * 40 

            next if data == ""


            request = Request.new(data)            


            result = @router.match_route(request)

            p result

            # if no result
            # check in file system (public folder)
            # generate new response for file
            # läs filen som binär data (IO.read("binfile", mode: "rb"))
            # set mime type

            if result == nil
                if File.file("./public" + request.resource)
                    @router.add_route(request.method, request.resource) do
                        IO.read("./public" + request.resource, mode: "rb")
                    end
                    result = @router.match_route(request)
                end
            end

            response = Response.new(result, session)
            response.send

        end
    end
end

