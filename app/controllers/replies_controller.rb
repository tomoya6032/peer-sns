class RepliesController < ApplicationController
    before_action :set_reply, only: [:show]
    before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
    before_action :set_tweet, only: [:show, :new, :create, :index] 

  def index          
    
    @replies = tweet.replies
   
#    render json: replies.to_json(include: :user)  
  end

  def show
    
    @reply = Reply.find_by(id: params[:id])
    @user = User.find_by(id: @reply.user_id)
    @replies = @tweet.replies


    # @replies = @tweet.replies.order(created_at: :desc)
    # @reply = Reply.new
    
  end

  def new
    # @tweet = Tweet.find(params[:tweet_id])
    
    @reply = @tweet.replies.build

  end
  
  def create
    @tweet = Tweet.find(params[:tweet_id])
    @reply = @tweet.replies.build(reply_params)
    @reply.user = current_user

    if @reply.save
      # リプライが保存された後の処理
      redirect_to @tweet
    else
      # リプライが保存できなかったときの処理
      flash[:alert] = 'リプライの保存に失敗しました。'
      redirect_to @tweet
    end
  end



  def destroy
    @reply = Reply.find(params[:id])
    @reply.destroy
    # リプライが削除された後の処理
    redirect_to @tweet
  end

  private

  def set_reply
    @reply = Reply.find(params[:id])
  end

  def set_tweet
    @tweet = Tweet.find(params[:tweet_id])
    
  end


  def reply_params
    params.require(:reply).permit(:content, :tweet_id)
  end
end
