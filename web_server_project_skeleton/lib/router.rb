class Router
  def initialize()
    @routes = {}
  end

  def add_route(method, params)
    @routes[method] = params
  end

  def match_route(request)

  end
end
