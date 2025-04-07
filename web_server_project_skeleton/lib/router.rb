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
      if route[:method] == request.method 
        # är det en dynamisk route?
        if route[:resource].include?(":")
          # dela upp den 
          route_split = route[:resource].split("/")
          dynamic = []
          request_split = request.resource.split("/")

          # är det lika många
          if request_split.length == route_split.length

          end

          route_split.each do |params|
            if params.include?(":")
              dynamic << params
            end
          end
          

          request.
          
        else
          if route[:resource] == request.resource
            return route
          end
        end

        # matchar den dynamiska routen requesten?
          require 'debug'
          binding.break
          # vilka params finns?
          # lägg till params i route
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

      
      