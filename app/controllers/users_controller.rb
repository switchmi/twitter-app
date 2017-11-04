class UsersController < BaseController
  def show
    @user = User.find(params[:id])
    @tweets = @user.tweets.all
    @users = User.all
    # @following = Following.all.where(followee_id: @user.id)
  end

end
