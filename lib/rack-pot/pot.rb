require 'rack'

module Rack

  class Pot
    
    CONTENT_TYPE = "application/coffee-pot-command".freeze

    def initialize(app)
      @app = app
    end

    def call(env)
      if env["CONTENT_TYPE"] == CONTENT_TYPE
        [418, {"Content-Type" => CONTENT_TYPE}, []]
      else
        @app.call(env)
      end
    end

  end
  
end
