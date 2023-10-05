class SetsController < ApplicationController
  def index
    @sets = CardSet.all
  end
end
