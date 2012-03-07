require_relative '../application.rb'
require 'rack/test'

set :environment, :test

def app
  Sinatra::Application
end

describe 'URL Shortening Service' do
  
  include Rack::Test::Methods
  
  it "should load the home page" do
    get '/'
    last_response.should be_ok
  end
  
  #it "should obtain a shortened URL from the query param" do
  #  get '/?url=http://www.google.com'
  #  last_response.should be_ok
  #end
  
  it "should fail when trying to expand a hash that hasnt been sent" do
    get '/expand/'
    last_response.should_not be_ok
  end
  
end