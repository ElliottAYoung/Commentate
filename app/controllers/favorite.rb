get '/users/:id/favorites' do
  @user = User.find(params[:id])
  @favorites = @user.favorites

  erb :"favorites/show"
end

post '/users/:user_id/videos/:id' do
  redirect '/home' unless current_user

  favorite = Favorite.new(user_id: params[:user_id], video_id: params[:id])

  redirect "/videos/#{params[:id]}"
end
