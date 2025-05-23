require_relative 'response'

class OKResponse < Response
  def initialize(result, session, content_type="text/html")
    super(result, 200, session, content_type)
  end
end