require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, {adapter: "sqlite3", database: "barbershop.db"}

class Client < ActiveRecord::Base
end

class Barber < ActiveRecord::Base
end

get '/' do
	erb :index			
end

# b = Barber.new :name => "Mark"
# b.new_record?
# b.save