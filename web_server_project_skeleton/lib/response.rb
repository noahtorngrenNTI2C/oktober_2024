require 'rainbow/refinement'
using Rainbow
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
  
  attr_reader :html

  def initialize(result, status, session, content_type="text/html")
    p "NEW RESPONSE #{self.inspect}"
    p session
    @result = result
    @status = status
    @session = session
    @html = "<h1>Hello Response</h1>"
    @content_type = content_type
  end

  def send
    if @result.class == Hash #block eller string 
      if !@result[:params] 
        require 'debug'
        binding.break
        html = @result[:block].call
      else
        html = @result[:block].call(@result[:params]) 
      end
    else
      html = @result
    end

    @session.print "HTTP/1.1 #{@status}\r\n"
    @session.print "Content-Type: #{@content_type}\r\n"
    @session.print "Content-Length: #{html.bytesize}\r\n"
    @session.print "\r\n"
    @session.print html
    @session.close
    puts "#{@content_type}".blue
    puts "#{@status}".red

    puts "#{html.bytesize}".green
  end

end