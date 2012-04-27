module Helpers
  def response_json
    ActiveSupport::JSON.decode @response.body
  end
end
