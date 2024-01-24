class Mypage::PensController < ApplicationController
  def index
    @pens = current_user.pens.order(created_at: :desc)
  end
end
