class TweetsController < BaseController

  def index
    @tweets = current_user.tweets.all
    @tweet = current_user.tweets.new

  end

  def create
    @tweets = current_user.tweets.all
    @tweet = current_user.tweets.new(get_params)
    if @tweet.save
      redirect_to tweets_path
    else
      render :index
    end
  end

  def destroy
    @tweet = current_user.tweets.find(params[:id])
    @tweet.destroy
    redirect_to tweets_path
  end

  private

  def get_params
    params.require(:tweet).permit(:text)
  end

end
