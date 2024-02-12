class ApplicationController < ActionController::Base
  add_flash_types :success, :info, :warning, :error
  before_action :require_login
  before_action :set_search_pens
  before_action :set_search_inks

  private

  def not_authenticated
    flash[:warning] = t('defaults.message.require_login')
    redirect_to login_path
  end

  def set_search_pens
    @q_pens = Pen.ransack(params[:q_pens])
  end

  def set_search_inks
    @q_inks = Ink.ransack(params[:q_inks])
  end
end
