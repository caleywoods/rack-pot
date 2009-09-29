require 'rack'

module Rack

  class Pot

    def initialize(app)
      @app = app
    end

    def call(env)
      if env["REQUEST_METHOD"] == "BREW"
        if env["CONTENT_TYPE"] == "application/coffee-pot-command"
          [418, {"Content-Type" => "application/coffee-pot-command"}, []]
        else
          [406, {}, []]
        end
      end
    end

  end
  
end
