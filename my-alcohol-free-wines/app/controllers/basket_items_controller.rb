class BasketItemsController < ApplicationController
  before_action :set_basket_item, only: [:show, :edit, :update, :destroy]

  # GET /basket_items
  # GET /basket_items.json
  def index
    @basket_items = BasketItem.all
  end

  # GET /basket_items/1
  # GET /basket_items/1.json
  def show
  end

  # GET /basket_items/new
  def new
    @basket_item = BasketItem.new
  end

  # GET /basket_items/1/edit
  def edit
  end

  # POST /basket_items
  # POST /basket_items.json
  # Method to be run when a post request is made to basket_items. Gets the user's
  # basket to store the wine in, tries to find the wine that the user has selected to
  # add to their basket by its wine_id from the wines table of the database and builds
  # a relationship between the basket_id and the wine_id and the quantity of the wine the user wants.
  # Then gives the customer a message saying the wine was successfully added to the basket.
  #
  # Method adapted from "Agile Web Development with Rails" (4th Edition) by Sam Ruby et al.,
  # chapter 9.
  def create()
    # Try and get the logged in user's basket from the session hash
    @basket = get_user_basket

    # Try and find the wine the customer has tried to add to their basket
    wine = Wine.find(params[:wine_id])

    # Get the quantity of the wine they want to add to their basket from
    # the request parameters
    wine_quantity = params[:quantity]

    # Build a relationship between the wine_id and its quantity and the basket_id
    @basket_item = @basket.basket_items.build(wine: wine, quantity: wine_quantity)

    respond_to do |format|
      if @basket_item.save
        format.html { redirect_to @basket_item.basket, notice: 'Product sucessfully added to basket' }
        format.json { render :show, status: :created, location: @basket_item }
      else
        format.html { render :new }
        format.json { render json: @basket_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /basket_items/1
  # PATCH/PUT /basket_items/1.json
  def update
    respond_to do |format|
      if @basket_item.update(basket_item_params)
        format.html { redirect_to @basket_item, notice: 'Basket item was successfully updated.' }
        format.json { render :show, status: :ok, location: @basket_item }
      else
        format.html { render :edit }
        format.json { render json: @basket_item.errors, status: :unprocessable_entity }
      end
    end
  end
  
  # DELETE /basket_items/1
  # DELETE /basket_items/1.json
  #
  # Method to be run when the customer tries to remove items from their
  # basket. This is run when a DELETE request is made to /basket_items/<id>
  # Looks to see if the quantity of the item in the basket is over 1 and
  # if so, reduces the quantity by one. Otherwise, destroys the link between the basket
  # and the wine item completely.
  def destroy
    # Check if the quantity of the basket item the user wants to remove from their
    # basket is greater than 1. If so, reduce the quantity by 1.
    if @basket_item.quantity > 1
      @basket_item.update_attribute(:quantity, @basket_item.quantity - 1)
    else
      # Otherwuse, destroy the link between the basket and the wine
      @basket_item.destroy
    end
    respond_to do |format|
      format.html { redirect_to :back, notice: 'Item removed from basket' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_basket_item
      @basket_item = BasketItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def basket_item_params
      params.require(:basket_item).permit(:wine_id, :basket_id, :quantity)
    end
end
