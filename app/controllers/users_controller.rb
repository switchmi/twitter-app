class UsersController < BaseController
  def show
    @user = User.find(params[:id])
    @tweets = @user.tweets.all
  end
end
