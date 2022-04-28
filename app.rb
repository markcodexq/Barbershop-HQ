require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, {adapter: "sqlite3", database: "barbershop.db"}

class Client < ActiveRecord::Base
	validates :name, {:presence => true}
	validates :phone, {:presence => true}
	validates :datestamp, {:presence => true}
	validates :color, {:presence => true}
end

class Barber < ActiveRecord::Base
end

class Contact < ActiveRecord::Base
end

before do
	@barbers = Barber.order "created_at desc"
end

get '/' do
	erb :index			
end

get '/visit' do	
	erb :visit
end

post '/visit' do

	# @user_name = params[:user_name]
	# @phone = params[:phone]
	# @date = params[:date]
	# @barber = params[:barber]
	# @colorpicker = params[:colorpicker]

	# client_new = Client.new(
	# 	name: @user_name,
	# 	phone: @phone,
	# 	datestamp: @date,
	# 	barber: @barber,
	# 	color: @colorpicker
	# )

	# client_new.save

	client_new = Client.new params[:client]

	client_new.save
	
	erb "User: #{}, Phone: #{@phone} Date: #{@date} Master: #{@barber} Color: #{@colorpicker}"
end

get '/contacts' do
	erb :contacts
end

post '/contacts' do
	# @email = params[:email_c]
	# @message = params[:message_c]

	# contact_new = Contact.new(
	# 	email: @email,
	# 	message: @message
	# )

	# contact_new.save

	contact_new = Contact.new params[:contact]
	contact_new.save
	
	erb "Email: #{@email}, Message: #{@message}"
end

# b = Barber.new :name => "Mark"
# b.new_record?
# b.save