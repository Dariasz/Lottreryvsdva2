class ItemsController < ApplicationController
  include ApplicationHelper
  before_action :set_item, only: [:bid, :show, :edit, :update, :destroy ]
  before_action :authenticate_user!, only: [ ]
  before_action :require_admin, only: [:create, :new,  :edit, :update, :destroy]

  # GET /items
  # GET /items.json
  def index
  #  @items = Item.page(params[:page])

    @q = Item.ransack(search_params)
    @items = @q.result(distinct: true).where(winner: nil).page(params[:page])

  end




  def bid
    @item.users << current_user
    @item.save
    redirect_to @item
  end

def draw
      # @winner = @item.users.sample
      # @item.bidded = true
       #@item.user = winner
       @item=Item.find(params[:id])
       if !@item.winner
       @item.winner = @item.users.sample
       @item.save
      UserMailer.WinEmail(@item.winner , @item).deliver_now
      redirect_to @item
  else
      redirect_to items_path
  end


end





  def search
    @q = Item.ransack(params[:q])
    @item = @q.result(distinct: true)
  end
  # GET /items/1
  # GET /items/1.json
  def show
  end

  # GET /items/new
  def new
    @item = Item.new
  end

  # GET /items/1/edit
  def edit
  end

  # POST /items
  # POST /items.json
  def create
    @item = Item.new(item_params)

    respond_to do |format|
      if @item.save
        format.html { redirect_to @item, notice: 'Item was successfully created.' }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
      end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to @item, notice: 'Item was successfully updated.' }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to items_url, notice: 'Item was successfully destroyed.' }
      format.json { head :no_content }
  end
end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    def search_params
      params.permit(q: [:item_cont])[:q].to_h
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require(:item).permit(:item, :description, :image)
    end
end
