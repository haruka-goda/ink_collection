class Mypage::InksController < ApplicationController
  def index
    @inks = current_user.inks.order(created_at: :desc)
  end
end
