require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Rack::Pot do

  describe "BREW" do
    
    def perform_request(content_type)
      app = lambda { |env| fail "Should not forward request for processing" }
      request = Rack::MockRequest.env_for("/", :method => "BREW", "CONTENT_TYPE" => content_type)
      Rack::Pot.new(app).call(request)
    end
    
    describe "Content-Type: application/coffee-pot-command" do
      
      it "returns 418 I'm a teapot" do
        response = perform_request("application/coffee-pot-command")
        response.should == [418, {"Content-Type" => "application/coffee-pot-command"}, []]
      end

    end

    describe "Any other content type" do

      it "returns 405 Method Not Allowed" do
        response = perform_request("text/html")
        response.should == [406, {}, []]
      end
      
      it "returns a valid Accept header"
      
    end
    
  end
  
  describe "Other request methods" do

    describe "Content-Type: application/coffee-pot-command" do

    end

    describe "Any other content type" do

      it "passes the request on untouched"
      
      it "returns a valid Accept header"
      
    end

  end

end
