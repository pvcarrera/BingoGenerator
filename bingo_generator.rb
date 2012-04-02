require 'sinatra'
require 'set'
require './card'
require './page'

get '/page' do
  @page = Page.new
  erb :plantilla
end


