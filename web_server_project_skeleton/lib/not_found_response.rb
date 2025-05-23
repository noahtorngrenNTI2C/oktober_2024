require_relative 'response'

class NotFoundResponse < Response

  def initialize(session)
    super(File.read("html/404.html"), 404, session, "text/html")
  end

end