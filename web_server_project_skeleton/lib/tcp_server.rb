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
                puts "THERE IS A RESULT"
                response = OKResponse.new(result, session)
            else
                puts "NO RESULT" 
                filepath = "./public" + request.resource
                if File.file?(filepath)
                     #@router.add_route(request.method, request.resource) do
                     
                     #TODO: Egen klass
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
                     
                     #TODO: Egen okResponse klass
                     #response = OKResponse.new(result, session, content_type)
                     response = Response.new(result, 200, session, content_type)
                else
                    #TODO: Egen not found klass
                     #NotFoundResponse.new(session)
                    response = Response.new(File.read("html/404.html"), 404, session, "text/html")
                     #end
                     #result = @router.match_route(request)
                 end
             end
            response.send
            #html = response.html
            #session.print "HTTP/1.1 200\r\n"
            #session.print "Content-Type: text/html\r\n"
            #session.print "\r\n"
            #session.print html
            #session.close
        end
    end
end

