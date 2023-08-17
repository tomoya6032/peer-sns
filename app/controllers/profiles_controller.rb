class ProfilesController < ApplicationController
    before_action :set_profile, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!

    # GET /profiles/1
    def show
      @profile = current_user.profile
    end
  
    # GET /profiles/new
    def new
      @profile = Profile.new
    end
  
    # GET /profiles/1/edit
    def edit
    end
  
    # POST /profiles
    def create
      @profile = Profile.new(profile_params)
      if @profile.save
        redirect_to @profile, notice: 'Profile was successfully created.'
      else
        render :new
      end
    end
  
    # PATCH/PUT /profiles/1
    def update
      if @profile.update(profile_params)
        redirect_to @profile, notice: 'Profile was successfully updated.'
      else
        render :edit
      end
    end
  
    # DELETE /profiles/1
    def destroy
      @profile.destroy
      redirect_to profiles_url, notice: 'Profile was successfully destroyed.'
    end
  
    private
    def set_profile
      @profile = Profile.find_by(user_id: current_user.id)
      if @profile.nil?
        redirect_to new_profile_path, notice: 'プロフィールを作成してください'
      end
    end

    # Use callbacks to share common setup or constraints between actions.
    # def set_profile
    #   @profile = Profile.find(params[:id])
    # end
  
    # Only allow a trusted parameter "white list" through.
    def profile_params
      params.require(:profile).permit(:name, :content, :location)
    end
end
