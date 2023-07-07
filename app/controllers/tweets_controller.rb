class TweetsController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create]
  
    def index
      @tweets = Tweet.all
    end
  
    def new
      @tweet = Tweet.new
    end
  
    def create
      @tweet = current_user.tweets.build(tweet_params)
      if @tweet.save
        redirect_to tweets_path, notice: '保存ができたよ'
      else
        flash.now[:error] = '保存に失敗しました'
        render :new
      end
    end
  
    private
  
    def tweet_params
      params.require(:tweet).permit(:content, :image)
    end
  
end
