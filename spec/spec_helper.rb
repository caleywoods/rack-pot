require 'rubygems'
require 'rack/mock'

# Support running specs with "rake spec" and "spec"
$LOAD_PATH.unshift("lib") unless $LOAD_PATH.include?("lib")

require 'rack-pot'
