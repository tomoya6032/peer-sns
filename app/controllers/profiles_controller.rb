class ProfilesController < ApplicationController
    # before_action :set_profile, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!

    # GET /profiles/1
    def show
      @profile = Profile.find_by(user_id: params[:user_id])
      @profile = current_user.profile

      @user = current_user
      @tweets = @user.tweets
      
      # @profile = Profile.find_by(user_id: current_user.id)
      # if @profile.nil?
      #   redirect_to new_profile_path, notice: 'プロフィールを作成してください'
      # else
      #   @user = current_user
      # end
      
    end
  
    # GET /profiles/new
    def new
      @profile = Profile.new
    end
  
    # GET /profiles/1/edit
    def edit
      @profile = current_user.prepare_profile
    end
  
    # POST /profiles
    def create
      # @profile = Profile.new(profile_params)
      # @profile.user_id = current_user.id
      # if @profile.save
      #   redirect_to profile_path, notice: 'Profile was successfully created.'
      # else
      #   render :new
      # end
    end
  
    # PATCH/PUT /profiles/1
    def update
      @profile = current_user.prepare_profile
      @profile.assign_attributes(profile_params)
      if @profile.save
        redirect_to profile_path, notice: 'Profile was successfully updated.'
      else
        flash.now[:error] = '更新できませんでした'
        render :edit
      end
    end
  
    # DELETE /profiles/1
    def destroy
      @profile.destroy
      redirect_to profiles_url, notice: 'Profile was successfully destroyed.'
    end
  
    private
    # def set_profile
    #   @profile = Profile.find_by(user_id: current_user.id)
    #   if @profile.nil?
    #     redirect_to new_profile_path, notice: 'プロフィールを作成してください'
    #   end
    # end

    # Use callbacks to share common setup or constraints between actions.
    # def set_profile
    #   @profile = Profile.find(params[:id])
    # end
  
    # Only allow a trusted parameter "white list" through.
    def profile_params
      params.require(:profile).permit(:name, :bio, :location)
    end
end
