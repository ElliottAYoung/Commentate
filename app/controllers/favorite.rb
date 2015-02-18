post '/users/:user_id/videos/:id' do
  redirect '/home' unless current_user

  favorite = Favorite.create(user_id: params[:user_id], video_id: params[:id])

  redirect "/videos/#{params[:id]}"
end
