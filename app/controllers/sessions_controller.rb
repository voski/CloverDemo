class SessionsController < ApplicationController
  def index
    client = OAuth2::Client.new('VTEQFHAVMJ5FP', 'client_secret', :site => 'https://clover.com/', :token_method  => :get)
    render json: 'test'
  end
end
