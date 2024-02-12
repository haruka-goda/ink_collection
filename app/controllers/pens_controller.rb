class PensController < ApplicationController
  skip_before_action :require_login, only: %i[index show]
  before_action :find_pen, only: %i[edit update destroy]

  def index
    @q_pens = Pen.ransack(params[:q])
    @pens = @q_pens.result(distinct: true).includes(:user).order(created_at: :desc).page(params[:page])
  end

  def new
    @pen = Pen.new
    @user_inks = current_user.inks.select(:id, :brand, :name)
  end

  def create
    @pen = current_user.pens.build(pen_params)
    @user_inks = current_user.inks.select(:id, :brand, :name)
    if @pen.save
      redirect_to mypage_pens_path, success: t('defaults.message.created', item: Pen.model_name.human)
    else
      flash.now['error'] = t('defaults.message.not_created', item: Pen.model_name.human)
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @pen = Pen.find(params[:id])
  end

  def edit
    @user_inks = current_user.inks.select(:id, :brand, :name)
  end

  def update
    if @pen.update(pen_params)
      redirect_to @pen, success: t('defaults.message.updated', item: Pen.model_name.human)
    else
      flash.now['error'] = t('defaults.message.not_updated', item: Pen.model_name.human)
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @pen.destroy!
    redirect_to mypage_pens_path, status: :see_other, success: t('defaults.message.deleted', item: Pen.model_name.human)
  end

  private

  def pen_params
    params.require(:pen).permit(:name, :brand, :nib, :purchase_date, :description, :pen_image, :pen_image_cache,
                                :ink_id)
  end

  def find_pen
    @pen = current_user.pens.find(params[:id])
  end
end
