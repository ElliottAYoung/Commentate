get 'user/:id/favorites' do
  @user = User.find(params[:id])
  @favorites = Favorite.where(@user.id = :user_id)

  erb :"favorites/show"
end
