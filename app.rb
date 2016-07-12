require './environment'

module FormsLab
  class App < Sinatra::Base
    get '/' do
      erb :root
    end
    get '/new' do
      erb :'pirates/new'
    end
    post '/pirates' do
      @pirate = Pirate.new(params[:pirate][:name], params[:pirate][:weight], params[:pirate][:height]) 
      ships_hashes = params[:pirate][:ships]
      @ships = []
      ships_hashes.each {|ship| @ships << Ship.new(ship[:name], ship[:type], ship[:booty])}
      erb :'pirates/show'
    end
  end
end
