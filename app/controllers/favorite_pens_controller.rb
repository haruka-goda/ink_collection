class FavoritePensController < ApplicationController
	def index
		@q_pen = current_user.favorited_pens.ransack(params[:q])
    @favorite_pens = @q_pen.result(distinct: true).includes(:user).order(created_at: :desc).page(params[:page])
	end


	def create
    pen = Pen.find(params[:pen_id])
    current_user.favorite_pen(pen)
    redirect_to pen_path(pen)
  end

  def destroy
    pen = current_user.favorite_pens.find(params[:id]).pen
    current_user.unfavorite_pen(pen)
    redirect_to pen_path(pen)
  end
end
