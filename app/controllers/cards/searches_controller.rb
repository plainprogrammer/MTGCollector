class Cards::SearchesController < ApplicationController
  def show
  end

  def create
    @search = params[:search]
    @cards = Card.includes(:set).where(name: @search)
  end
end
