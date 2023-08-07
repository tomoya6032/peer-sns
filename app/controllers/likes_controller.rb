class LikesController < ApplicationController
    before_action :authenticate_user!
  

    def show
      tweet = Tweet.find(params[:tweet_id])
      like_status = current_user.has_liked?(tweet)
      render json: { hasLiked: like_status }
      
    end

    def create
      tweet = Tweet.find(params[:tweet_id])
      tweet.likes.create!(user_id: current_user.id)
      render json: { status: 'ok' }
    end
  
    def destroy
      tweet = Tweet.find(params[:tweet_id])
      like = tweet.likes.find_by!(user_id: current_user.id)
      like.destroy!
      render json: { status: 'ok' }
    end
end