require('pry-byebug')
require_relative('../models/artist')

get '/artists' do
  @artists = Artist.all()
  erb(:'artist/index')
end

get '/artists/new' do
  erb(:'artist/new')
end

post '/artists' do
  @artist = Artist.new(params)
  @artist.save()
  erb(:'artist/create')
end

get '/artists/:id' do
  @artist = Artist.find(params[:id])
  erb(:'artist/show')
end

get '/artists/:id/edit' do
  @artist = Artist.find( params[:id] )
  erb( :'artist/edit' )
end

put '/artists/:id' do
 @artist = Artist.update( params )
 redirect to( "/artists/#{params[:id]}" )
end

delete '/artists/:id' do
  Artist.destroy( params[:id] )
  redirect to('/artists')
end