class Mypage::InksController < ApplicationController
  def index
    @q_inks = current_user.inks.ransack(params[:q])
    @inks = @q_inks.result(distinct: true).order(created_at: :desc).page(params[:page])
  end
end
