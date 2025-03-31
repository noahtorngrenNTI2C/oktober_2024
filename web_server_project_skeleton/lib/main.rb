require_relative 'tcp_server'
require_relative 'router'

@router = Router.new
@server = HTTPServer.new(4567, @router)


def get(resource, &block)
    
    
    method = :get
    resource = resource
    block = block 
    @router.add_route(method,resource,&block)
end

# nästa steg dynamiska routes 



def post(resource, &block)
    method = :post
    resource = resource
    block = block

    @router.add_route(method,resource,&block)
end

