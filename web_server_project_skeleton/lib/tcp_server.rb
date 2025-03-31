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

            

            # if no result
            # check in file system (public folder)
            # generate new response for file
            # läs filen som binär data (IO.read("binfile", mode: "rb"))
            # set mime type


            if result
                response = Response.new(result, session)
            else result
                filepath = "./public" + request.resource
                if File.file?(filepath)
                    #@router.add_route(request.method, request.resource) do
                    #kolla i filepath vad det är för filtyp
                    filetype = File.extname(filepath).downcase
                    #jämför med mime types
                    content_type = case filetype
                    when ".html" then "text/html"
                    when ".css" then "text/css"
                    when ".js" then "application/javascript"    
                    when ".jpg", ".jpeg" then "image/jpeg"
                    when ".png" then "image/png"
                    when ".gif" then "image/gif"
                    when ".svg" then "image/svg+xml"
                    when ".ico" then "image/x-icon"
                    when ".txt" then "text/plain"
                    when ".pdf" then "application/pdf"
                    when ".zip" then "application/zip"
                    when ".mp4" then "video/mp4"
                    when ".mp3" then "audio/mpeg"
                    end
                    
                    #sätt content_type
                    result = IO.read(filepath, mode: "rb")
                    response = Response.new(result, session, content_type)

                    #end
                    #result = @router.match_route(request)
                end
            end

            response.send

        end
    end
end

