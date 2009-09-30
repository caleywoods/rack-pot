require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Rack::Pot do
  
  def do_call(content_type, request_method, &block)
    request = Rack::MockRequest.env_for("/", "CONTENT_TYPE" => content_type, :method => request_method)
    @response = Rack::Pot.new(block).call(request)    
  end

  %w{BREW POST GET PUT DELETE HEAD}.each do |method|

    describe method do
  
      describe "text/html" do
      
        before do
          do_call("text/html", method) { |env| :result  }
        end

        it "forwards the request for processing" do
          @response.should == :result
        end

      end

      describe "application/coffee-pot-command" do
    
        before do
          do_call("application/coffee-pot-command", method) { |env| fail "Should not forward request for processing" }    
        end
    
        it "returns 418 I'm a teapot" do
          @response.should == ["418 I'm a teapot", {"Content-Type" => "application/coffee-pot-command", "Content-Length" => "0"}, []]
        end

      end
      
    end
    
  end

end
