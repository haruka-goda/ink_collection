class PensController < ApplicationController
  def index
    @pens = Pen.all.includes(:user).order(created_at: :desc)
  end
end
