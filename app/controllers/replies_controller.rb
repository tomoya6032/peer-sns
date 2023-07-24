class RepliesController < ApplicationController
    before_action :set_tweet, only: [:index, :show, :new, :create]


  def index          
   
    @replies = @tweet.replies
#    render json: replies.to_json(include: :user)  
  end

  def show
    
    @replies = @tweet.replies
    @reply = @replies.find(params[:id])
    
  end

  def new
    @reply = @tweet.replies.build

  end
  
  def create
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

  def set_tweet
    @tweet = Tweet.find(params[:tweet_id])
  end

  def reply_params
    params.require(:reply).permit(:content)
  end
end
