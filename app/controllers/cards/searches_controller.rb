class Cards::SearchesController < ApplicationController
  def show
  end

  def create
    @search = params[:search]
    @cards = Card.includes(:set)
                 .where(name: @search)
                 .order("card_sets.released_on DESC")
  end
end
