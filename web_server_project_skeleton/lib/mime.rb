#kommer ge request.resource

class Mime

  def initialize(resource)
    @resource = resource

  end

  def content_type
    filepath = "./public" + @resource
    if File.file?(filepath)
      filetype = File.extname(filepath).downcase
      
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
    end
  end
end