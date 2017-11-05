class HashtagsController < BaseController
  def create
    @tweet = Tweet.find(params[:tweet_id])
    @tags = @tweet.hashtags.all
    @tag = @tweet.hashtags.create(get_params)
    if @tag.valid?
      redirect_to edit_tweet_path(@tweet)
    else
      render 'tweets/edit'
    end
  end

  def destroy
    @tweet = Tweet.find(params[:tweet_id])
    @tags = @tweet.hashtags.all
    @tag = Hashtag.find(params[:id])
    @tag.destroy
    respond_to do |format|
      format.html {redirect_to edit_tweet_path(@tweet)}
      format.js
    end


  end

  private

  def get_params
    params_hash = params.require(:hashtag).permit(:name)
    params_hash[:user_id] = params[:user_id]
    params_hash
  end

end
