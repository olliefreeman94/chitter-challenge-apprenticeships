require 'sinatra/base'
require_relative './lib/peep'

class Chitter < Sinatra::Base
  get '/test' do
    'Test page'
  end

  get '/' do
    erb :index
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end

  post '/peeps' do
    Peep.add(message: params[:message], date: params[:date])
    redirect '/peeps'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  get '/peeps/search' do
    erb :'peeps/search'
  end

  get '/peeps/filtered' do
    @peeps = Peep.filter(params[:keyword])
    @view_all_button = 1
    erb :'peeps/index'
  end

  run! if app_file == $0
end
