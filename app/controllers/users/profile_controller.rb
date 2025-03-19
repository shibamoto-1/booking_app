class Users::ProfileController < ApplicationController
  before_action :authenticate_user!
  
  def show
    @user = current_user
  end
  
  def edit
    @user = current_user
  end

  def update
    if current_user.update(profile_params)
      redirect_to users_profile_path, notice: 'プロフィール情報が更新されました'
    else
      render :edit
    end
  end

  private

  def profile_params
    params.require(:user).permit(:name, :profile, :image)
  end
end
