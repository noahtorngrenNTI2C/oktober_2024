class Router
  def initialize()
    @routes = []
  end

  def add_route(method, resource, &block)
    @routes << {method:  method, resource: resource, block: block}
  end

  def match_route(request)
    @routes.each do |route|
      if route[:method] == request.method 
        if route[:resource].include?(":")
          route_split = route[:resource].split("/")
          request_split = request.resource.split("/")
  
          # Kolla att längden är samma
          if route_split.length == request_split.length
            dynamic_value = []
            match = true
  
            route_split.each_with_index do |part, index|
              if part.start_with?(":")
                dynamic_value << request_split[index]
              elsif part != request_split[index]
                match = false
                break
              end
            end
  
            if match
              route[:params] = dynamic_value
              return route
            end
          end
        else
          if route[:resource] == request.resource
            return route
          end
        end
      end
    end
    return false
  end
end

#router = Router.new
#router.add_route(:get, "/gubbe")
#router.add_route(:get, "/banan")

#pp router

      
      