# följande logik som:

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

class Response 
  
  def initialize(result, session)
    @result = result
    @session = session

  end

  def send
    if @result 
      
      status = 200
      html = @result[:block].call 
    else
      status = 404
      html = "<h1>:(</h1>"
    end

    @session.print "HTTP/1.1 #{status}\r\n"
    #content-type jpg html
    puts html
    @session.print "Content-Type: text/html\r\n"
    # content-length (bytes)
    @session.print "Content-Length: #{html.bytesize}\r\n"
    @session.print "\r\n"
    @session.print html
    @session.close
  end

end