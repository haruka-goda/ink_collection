class PensController < ApplicationController
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
      render :new
    end
  end

  def show
    @pen = Pen.find(params[:id])
  end

  private

  def pen_params
    params.require(:pen).permit(:name, :brand, :color, :ink_level, :purchase_date, :description)
  end
end
