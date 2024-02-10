class Mypage::PensController < ApplicationController
  def index
    @q_pens = current_user.pens.ransack(params[:q])
    @pens = @q_pens.result(distinct: true).order(created_at: :desc).page(params[:page])
  end
end
