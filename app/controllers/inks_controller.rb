class InksController < ApplicationController
  def index
    @inks = Ink.all.includes(:user).order(created_at: :desc)
  end
end
