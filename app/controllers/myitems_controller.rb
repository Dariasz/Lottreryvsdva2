class MyitemsController < ApplicationController
  def index
    @q = Item.ransack(search_params)
    @items = @q.result(distinct: true)
  end


  private
  def search_params
    params.permit(q: [:item_cont])[:q].to_h
  end
end
