filepath = "./public" + request.resource
                if File.file?(filepath)
                     #@router.add_route(request.method, request.resource) do
                     
                     #TODO: Egen klass
                     #kolla i filepath vad det är för filtyp
                     filetype = File.extname(filepath).downcase
                     #jämför med mime types
                     content_type = case filetype
                     when ".html" then "text/html"
                     when ".css" then "text/css"
                     when ".js" then "application/javascript"    
                     when ".jpg", ".jpeg" then "image/jpeg"
                     when ".png" then "image/png"
                     when ".gif" then "image/gif"
                     when ".svg" then "image/svg+xml"
                     when ".ico" then "image/x-icon"
                     when ".txt" then "text/plain"
                     when ".pdf" then "application/pdf"
                     when ".zip" then "application/zip"
                     when ".mp4" then "video/mp4"
                     when ".mp3" then "audio/mpeg"
                     end




class Mime

  def initialize(resource)

  end

end