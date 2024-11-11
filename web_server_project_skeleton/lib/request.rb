  class Request
    def initialize(request_string)
      @request_string_split = request_string.split("\n")
      @first_line = request_string_split[0]
  
    end
  
    def method()
      method = @first_line.split(" ")[0]
  
    end
  
    def resource()
      resource = @first_line[0].split(" ")[1]
  
    end
  
    def version()
      version = @first_line.split(" ")[2]
  
    end
  
    def headers()
      temp = @request_string_split.dup
      temp.delete_at(0)
      
      headers = Hash.new
      temp2 = temp[0].split
      headers['Host'] = temp2.split(" ")[0]
      headers['Accept-Language'] = temp2.split(" ")[1]
      headers
    end
  
    def params()
      temp = @request_string_split[4]
      
    end
  end
  
