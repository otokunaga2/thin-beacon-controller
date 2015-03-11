# coding: utf-8
#
require 'mysql2'

class Dbconnector
  def initialize()
    #puts "hello"
    @@client = Mysql2::Client.new(host: 'XXXXXXX', username: 'alice', password: 'alice_pass', database: 'beacontext')
    #puts @@client 
  end
  #get location by userid
  def get_location (user_id)
    @@client.query("SELECT * FROM user WHERE userid = '#{user_id}'").each do |row|
     row
    end

  end
  def get_all_beaoconlogs
    list=[]
    @@client.query('select * from beaconlog').each do |row|
      list.push(row)
    end
  end
  def locaiton_update (beaconid,location,lastupdate)
    @@client.query("update user eaconlog set location = '#{location}', lastupdate ='#{lastupdate}' WHERE uuid ='#{beaconid}'")
  end
end
#tmp = Dbconnector.new
#puts tmp.locaiton_update(3,"soto")
#puts tmp.get_location("tokunaga")
#tmp.get_all_beaoconlogs
