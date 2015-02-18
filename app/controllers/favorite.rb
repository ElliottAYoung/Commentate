get '/user/:id/favorites' do
  @user = User.find(params[:id])
  @favorites = @user.favorites

  erb :"favorites/show"
end
