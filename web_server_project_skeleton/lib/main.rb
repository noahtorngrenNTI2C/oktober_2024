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
# def get(resoure, &block)
#     method = :get
#     resource = resource
#     block = block 
#     array = resource.split("/")
#     dynamiska = []

#     array.each do |item|
#         if item.include?(":")
#             dynamiska << item
#         end
#     end
#     dynamiska
# end


def post(resource, &block)
    method = :post
    resource = resource
    block = block

    @router.add_route(method,resource,&block)
end

