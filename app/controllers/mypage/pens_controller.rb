class Mypage::PensController < ApplicationController
  def index
    @pens = current_user.pens.order(created_at: :desc).page(params[:page])
  end
end
