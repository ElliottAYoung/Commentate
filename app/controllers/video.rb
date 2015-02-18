before '/videos/delete/:id' do
  redirect '/home' unless (Favorite.user_id = params[:id])
end

get '/home' do #RESTfully /videos
  @videos = Video.all
  erb :index
end

get '/videos/new' do
  erb :"videos/new"
end

get '/video/:id' do
  @video = Video.find(params[:id])

  erb :"videos/show"
end

post '/videos' do
  @video = Video.new(params[:video])

  if @video.save
    redirect '/home'
  else
    erb :"/videos/new"
  end
end

delete '/videos/delete/:id' do
  video = Video.find(params[:id])
  video.delete

  redirect '/home'
end
