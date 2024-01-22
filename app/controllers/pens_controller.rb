class PensController < ApplicationController
  before_action :find_pen, only: [:edit, :update, :destroy]

  def index
    @pens = Pen.all.includes(:user).order(created_at: :desc)
  end

  def new
    @pen = Pen.new
  end

  def create
    @pen = current_user.pens.build(pen_params)
    if @pen.save
      redirect_to pens_path, success: t('defaults.message.created', item: Pen.model_name.human)
    else
      flash.now['error'] = t('defaults.message.not_created', item: Pen.model_name.human)
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @pen = Pen.find(params[:id])
  end

  def edit; end

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
    redirect_to pens_path, status: :see_other, success: t('defaults.message.deleted', item: Pen.model_name.human)
  end

  private

  def pen_params
    params.require(:pen).permit(:name, :brand, :color, :ink_level, :purchase_date, :description)
  end

  def find_pen
    @pen = current_user.pens.find(params[:id])
  end
end
