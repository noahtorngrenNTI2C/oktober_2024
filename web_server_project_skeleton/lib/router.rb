class Router
  def initialize()
    @routes = []
  end

  def add_route(method, resource, &block)
    @routes << {method:  method, resource: resource, block: block}
  end

  def match_route(request)
    #hITTA SAKEN I @ROUTES SOM MATCHAR
    @routes.each do |route|
      if route[:method] == request.method && route[:resource] == request.resource
        return route
      end
    end
    return false
  end
end

#router = Router.new
#router.add_route(:get, "/gubbe")
#router.add_route(:get, "/banan")

#pp router

      
      