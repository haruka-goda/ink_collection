class InksController < ApplicationController
  def index
    @inks = Ink.all.includes(:user).order(created_at: :desc)
  end

  def new
    @ink = Ink.new
  end

  def create
    @ink = current_user.inks.build(ink_params)
    if @ink.save
      redirect_to inks_path, success: t('defaults.message.created', item: Ink.model_name.human)
    else
      flash.now['error'] = t('defaults.message.not_created', item: Ink.model_name.human)
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @ink = Ink.find(params[:id])
  end

  private

  def ink_params
    params.require(:ink).permit(:name, :brand, :nib, :purchase_date, :description)
  end
end
