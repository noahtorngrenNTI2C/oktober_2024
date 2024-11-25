  class Request

    attr_reader :method, :resource, :version, :headers, :params


    def initialize(request_string)
      @request_string_double_split = request_string.split("\n\n")
      @request_string_split = request_string.split("\n")
      @first_line = @request_string_split[0]
      @method = @first_line.split(" ")[0].downcase.to_sym
      
      @resource = @first_line.split(" ")[1]
      @version = @first_line.split(" ")[2]
      @headers = headers_setup()
      @params = params_setup
      
    end
  
    def headers_setup()
      temp = @request_string_split.dup
      temp.delete_at(0)
      headers = {}

      
      temp.each do |value|
        list = value.split(": ")
        headers[list[0]] = list[1]

      end

      #loopa genom temp
      #splitta varje (så du får nycke, värde)
      #lägg in i headers
      
      #temp2 = temp[0].split
      #headers['Host'] = temp2.split(" ")[0]
      #headers['Accept-Language'] = temp2.split(" ")[1]
      headers
    end

    def params_setup
      resource = self.resource
      first_params = @request_string_double_split[1]
      params = {}

      if resource.include?('?') 
        _,temp = resource.split('?')
        temp.split('&').each do |value|
          key, index = value.split('=')
          params[key] = index
        end

      end

      if first_params != nil
        first_params.split('&').each do |value|
          key, index = value.split('=')
          params[key] = index
        end
      end

      params
    end
  
    #def params()
     # temp = @request_string_split[4]
      
    #end
  end
  
