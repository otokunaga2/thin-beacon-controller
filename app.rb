# encoding: utf-8
require './sqlite.rb'
require 'sinatra'
configure do 
  #create the interface for vm
  @@dbmanager = Dbconnector.new
end
get '/' do
  @list= []
  @list = @@dbmanager.get_all_beaoconlogs
  erb :index
end
get '/beacon/update/:uuid/:location' do
  uuid_val = params[:uuid]
  location = params[:location]
  current_time = Time.now.strftime("%Y-%m-%d %H:%M:%S")
  @@dbmanager.locaiton_update(uuid_val, location,current_time)
end

# this enables to access from outside
set :environment, :production

