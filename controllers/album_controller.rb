require('pry-byebug')
require_relative('../models/album')
require_relative('../models/artist')

get '/albums' do
  @albums = Album.all()
  erb(:'album/index')
end

get '/albums/new' do
  erb(:'album/new')
end

post '/albums' do
  @album = Album.new(params)
  @album.save()
  erb(:'album/create')
end

get '/albums/:id' do
  @album = Album.find(params[:id])
  erb(:'album/show')
end

get '/albums/:id/edit' do
  @album = Album.find( params[:id] )
  @artists = Artist.all()
  erb( :'album/edit' )
end

put '/albums/:id' do
 @album = Album.update( params )
 redirect to( "/albums/#{params[:id]}" )
end

delete '/albums/:id' do
  Album.destroy( params[:id] )
  redirect to('/albums')
end