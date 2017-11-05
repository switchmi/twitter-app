class TweetsController < BaseController

  def index
    @user_tweets = current_user.tweets.all
    @followees = current_user.followees.all
    @tweets = []
    @user_tweets.each do |tweet|
      @tweets.push(tweet)
    end
    @followees.each do |followee|
      followee.tweets.each do |tweet|
        @tweets.push(tweet)
      end
    end
    @tweet = current_user.tweets.new
    @users = User.all
    @user = current_user

  end

  def create
    @tweets = current_user.tweets.all
    @tweet = current_user.tweets.new(get_params)
    @users = User.all
    if @tweet.save
      flash[:error] = ''
      respond_to do |format|
        format.html {redirect_to tweets_path}
        format.js
      end
    else
      @tweet = current_user.tweets.new
      flash[:error] = 'Text cannot be blank!'
      respond_to do |format|
        format.html {render :index}
        format.js
      end
    end
  end

  def edit
    @tweet = current_user.tweets.find(params[:id])
    @tag = @tweet.hashtags.new
    @tags = @tweet.hashtags.all
  end

  def _edit
    @tweet = current_user.tweets.find(params[:id])
  end

  def update
    @tweet = current_user.tweets.find(params[:id])
    if @tweet.update(get_params)
      redirect_to tweets_path
    else
      render :index
    end
  end

  def destroy
    @user = current_user
    @tweets = current_user.tweets.all
    @tweet = current_user.tweets.find(params[:id])
    @tweet.destroy
    respond_to do |format|
      format.js
      format.html { redirect_to tweets_path }
    end
  end

  private

  def get_params
    params.require(:tweet).permit(:text)
  end

end
