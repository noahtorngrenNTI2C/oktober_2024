class Router
  def initialize()
    @routes = []
  end

  def add_route(method, resource)
    @routes << {method:  method, resource: resource}
  end

  def match_route(request)
    pp request
    pp @routes
    #hITTA SAKEN I @ROUTES SOM MATCHAR
  end
end

#router = Router.new
#router.add_route(:get, "/gubbe")
#router.add_route(:get, "/banan")

#pp router

      
      