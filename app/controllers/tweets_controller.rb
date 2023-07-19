class TweetsController < ApplicationController
    
    before_action :set_tweet, only: [:show, :destroy]
    before_action :authenticate_user!, only: [:new, :show, :create, :edit, :update, :destroy]
  
    def index
      @tweets = Tweet.all
      @tweet = current_user.tweets.build
    end
  
    def new
      @tweet = current_user.tweets.build
      
    #   respond_to do |format|
    #     format.js # new.js.erb
    #   end

    end

    def show
        
    end
  
    def create
      
      @tweet = current_user.tweets.build(tweet_params)
      if @tweet.save
        redirect_to tweets_path, notice: '保存ができたよ'
        # respond_to do |format|
        #   format.js
       else
        flash.now[:error] = '保存に失敗しました'
        render :new
       end
    end

    def destroy
      if @tweet.user == current_user
         @tweet.destroy
         redirect_to tweets_path, notice: 'このツイートを削除しました'
      else
         redirect_to tweets_url, notice: 'このツイートは削除できません'
      end
    end
  

    private
      def set_tweet
        @tweet = Tweet.find(params[:id])
      end

      def tweet_params
        params.require(:tweet).permit(:content, images: [])
      end
  
end
