get '/home' do #RESTfully /videos
  @videos = Video.all
  erb :index
end
