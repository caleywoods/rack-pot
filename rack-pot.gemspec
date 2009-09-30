require 'lib/rack-pot/version'

Gem::Specification.new do |s|
  s.name             = "rack-pot"
  s.version          = Rack::Pot::VERSION
  s.platform         = Gem::Platform::RUBY
  s.has_rdoc         = true
  s.extra_rdoc_files = ["README.rdoc", "History.rdoc", "TODO", "LICENSE"]
  s.summary          = "Rack middleware that complies with Hyper Text Coffee Pot Control Protocol (HTCPCP) 1.0"
  s.description      = s.summary
  s.author           = "Simon Harris"
  s.email            = "haruki.zaemon@gmail.com"
  s.homepage         = "http://github.com/harukizaemon/rack-pot"
  s.require_path     = "lib"
  s.files            = Dir["lib/**/*", "spec/**/*", "tasks/**/*", "Rakefile"] + s.extra_rdoc_files
                       
  s.add_dependency("rack")
end
