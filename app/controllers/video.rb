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

get '/videos/:id' do
  @video = Video.find(params[:id])

  erb :"videos/show"
end

post '/videos' do
  embed_url = convert_url(params[:video_url])
  @video = Video.new(video_name: params[:video_name],
                     video_url: embed_url,
                     description: params[:description],
                     rating: 0,
                     user_id: current_user.id)
  p @video

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
