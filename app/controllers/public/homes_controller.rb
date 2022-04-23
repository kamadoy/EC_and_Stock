class Public::HomesController < ApplicationController
  def top
    @items = Item.last(5)
  end


end
