class FavoriteInksController < ApplicationController
	def index
		@q_ink = current_user.favorited_inks.ransack(params[:q])
    @favorite_inks = @q_ink.result(distinct: true).includes(:user).order(created_at: :desc).page(params[:page])
	end

	def create
    ink = Ink.find(params[:ink_id])
    current_user.favorite_ink(ink)
    redirect_to ink_path(ink)
  end

  def destroy
    ink = current_user.favorite_inks.find(params[:id]).ink
    current_user.unfavorite_ink(ink)
    redirect_to ink_path(ink)
  end

end
