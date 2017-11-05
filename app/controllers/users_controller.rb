class UsersController < BaseController
  def show
    @user = User.find(params[:id])
    @tweets = @user.tweets.all
    @users = User.all
    # @following = Following.all.where(followee_id: @user.id)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(get_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  private

  def get_params
    params.require(:user).permit(:avatar)
  end

end
