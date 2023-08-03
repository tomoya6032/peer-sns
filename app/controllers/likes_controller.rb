class LikesController < ApplicationController
    before_action :authenticate_user!
  

    def show
      tweet = Tweet.find(params[:tweet_id])
      like_status = current_user.has_liked?(tweet)
      render json: { hasLiked: like_status }
    end

    def create
      @like = current_user.likes.build(tweet_id: params[:tweet_id])
      @like.save
      redirect_to tweets_path
    end
  
    def destroy
      @like = Like.find_by(tweet_id: params[:tweet_id], user_id: current_user.id)
      @like.destroy
      redirect_to tweets_path
    end
end