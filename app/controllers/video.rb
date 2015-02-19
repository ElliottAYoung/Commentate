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

get '/videos/:id/like' do
  video = Video.find(params[:id])
  video.likes.create(value: 1)

  content_type :json
  {like_count: video.likes.count}.to_json
end

post '/videos' do
  embed_url = convert_url(params[:video_url])
  @video = Video.new(video_name: params[:video_name],
                     video_url: embed_url,
                     description: params[:description],
                     rating: 0,
                     user_id: 1)

  if @video.save

    params[:tags].split(",").map(&:strip).each do |tag|
      the_tag = Tag.find_by(name: tag)
      the_tag = Tag.create(name: tag) unless the_tag

      @video.tags << the_tag
    end
    
    redirect '/home'
  else
    erb :"/videos/new"
  end
end

delete '/videos/delete/:id' do
  video = Video.find(params[:id])
  video.destroy

  redirect '/home'
end
