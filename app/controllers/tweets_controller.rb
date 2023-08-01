class TweetsController < ApplicationController
    
    before_action :set_tweet, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  
    def index
      @tweets = Tweet.all
      # @tweet = current_user.tweets.build
      @tweet = Tweet.new
    end
  

    def show
      @tweet = Tweet.find(params[:id])
      @reply = Reply.find_by(id: params[:id])
      @user = User.find_by(id: @reply.user_id)
      @replies = @tweet.replies  

    end


    def new
      @tweet = current_user.tweets.build
      
    #   respond_to do |format|
    #     format.js # new.js.erb
    #   end

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

    def edit
      @tweet = current_user.tweets.find(params[:id])
      @user = @tweet.user  
    
    
    end

    def update
      @tweet = current_user.tweets.find(params[:id])
      
      if @tweet.update(tweet_params)
        redirect_to tweet_path(@tweet),notice: '更新できました'
      else
        flash.now[:error] = '更新できませんでした'
        render :edit
      end

    end

    def destroy
      # tweet = current_user.tweets.find(params[:id])
      @tweet.destroy!
      redirect_to tweets_path, notice: '削除に成功しました'

    end
  

    private
      

      def tweet_params
        params.require(:tweet).permit(:content, images: [])
      end

      def set_tweet
        @tweet = Tweet.find(params[:id])
      end
  
end
