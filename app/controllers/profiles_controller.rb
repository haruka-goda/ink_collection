class ProfilesController < ApplicationController
  before_action :set_user, only: %i[edit update]
  
  def edit; end

  def update
    if @user.update(user_params)
      redirect_to profile_path, success: t('defaults.message.updated', item: User.model_name.human)
    else
      flash.now['error'] = t('defaults.message.not_updated', item: User.model_name.human)
      render :edit, status: :unprocessable_entity
    end
  end

  def show
    @pen = current_user.pens.first
  end

  private

  def set_user
    @user = User.find(current_user.id)
  end

  def user_params
    params.require(:user).permit(:name, :email, :avatar, :avatar_cache)
  end
end
