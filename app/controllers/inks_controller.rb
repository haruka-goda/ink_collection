class InksController < ApplicationController
  skip_before_action :require_login, only: [:index, :show]
  before_action :find_ink, only: [:edit, :update, :destroy]

  def index
    @inks = Ink.all.includes(:user).order(created_at: :desc).page(params[:page])
  end

  def new
    @ink = Ink.new
  end

  def create
    @ink = current_user.inks.build(ink_params)
    if @ink.save
      redirect_to mypage_inks_path, success: t('defaults.message.created', item: Ink.model_name.human)
    else
      flash.now['error'] = t('defaults.message.not_created', item: Ink.model_name.human)
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @ink = Ink.find(params[:id])
  end

  def edit; end

  def update
    if @ink.update(ink_params)
      redirect_to @ink, success: t('defaults.message.updated', item: Ink.model_name.human)
    else
      flash.now['error'] = t('defaults.message.not_updated', item: Ink.model_name.human)
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @ink.destroy!
    redirect_to mypage_inks_path, status: :see_other, success: t('defaults.message.deleted', item: Ink.model_name.human)
  end


  private

  def ink_params
    params.require(:ink).permit(:name, :brand, :nib, :purchase_date, :description)
  end

  def find_ink
    @ink = current_user.inks.find(params[:id])
  end
end
