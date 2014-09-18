require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, "sqlite3:barbershop.db"

class Client < ActiveRecord::Base
end

class Barber < ActiveRecord::Base
end

before do
	@barbers = Barber.all
end

get '/' do
	erb :index			
end

get '/visit' do
	erb :visit
end

post '/visit' do

	@username = params[:username]
	@phone = params[:phone]
	@datetime = params[:datetime]
	@barber = params[:barber]
	@color = params[:color]

	# name, phone, datestamp, barber, color

	c = Client.new
	c.name = @username
	c.phone = @phone
	c.datestamp = @datetime
	c.barber = @barber
	c.color = @color
	c.save

	erb "<h2>Спасибо, вы записались!</h2>"

end
