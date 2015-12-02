class WinesController < ApplicationController
  require 'rest_client'
  API_ROOT = "http://localhost:5000/"

  before_action :set_wine, only: [:show, :edit, :update, :destroy]

  # GET /wines
  # GET /wines.json
  def index
    # TODO Need some way of only inserting the thing to the database if
    # it's not already in there - perhaps do this with a unique identifier
    #
    # result_wine = find_by_ISBN(isbn: isbn)
    # if result_wine == nil or result_wine.price > this_wine.price
    #   add_wine_to_database
    #
    # Wine.delete_all
    #
    # Need to also get the wines from the other supplier and only display the cheapest wine

    index_url = "#{API_ROOT}wines/"
    raw_response = RestClient.get(index_url)

    jsonised_response = JSON.parse(raw_response)

    for item in jsonised_response['wines'] do
      result_wine = Wine.find_by(barcode: item['barcode'])
      if result_wine == nil
        new_wine = Wine.new
        new_wine.short_description = item['short_description']
        new_wine.bottle_size = item['bottle_size']
        new_wine.price = item['price']
        new_wine.long_description = item['long_description']
        new_wine.origin_country = item['origin_country']
        new_wine.company = item['company']
        new_wine.grape_type = item['grape_type']
        new_wine.is_vegetarian = item['is_vegetarian']
        new_wine.image_url = item['image_url']
        new_wine.barcode = item['barcode']
        new_wine.save
      end
    end

    # REFERENCE THIS LINE IS FROM http://railscasts.com/episodes/37-simple-search-form?autoplay=true
    @wines = Wine.search(params[:search]).order(:short_description).paginate(page: params[:page], per_page: 6)
  end

  # GET /wines/1
  # GET /wines/1.json
  def show
  end

  # GET /wines/new
  def new
    @wine = Wine.new
  end

  # GET /wines/1/edit
  def edit
  end

  # POST /wines
  # POST /wines.json
  def create
    @wine = Wine.new(wine_params)

    respond_to do |format|
      if @wine.save
        format.html { redirect_to @wine, notice: 'Wine was successfully created.' }
        format.json { render :show, status: :created, location: @wine }
      else
        format.html { render :new }
        format.json { render json: @wine.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /wines/1
  # PATCH/PUT /wines/1.json
  def update
    respond_to do |format|
      if @wine.update(wine_params)
        format.html { redirect_to @wine, notice: 'Wine was successfully updated.' }
        format.json { render :show, status: :ok, location: @wine }
      else
        format.html { render :edit }
        format.json { render json: @wine.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /wines/1
  # DELETE /wines/1.json
  def destroy
    @wine.destroy
    respond_to do |format|
      format.html { redirect_to wines_url, notice: 'Wine was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_wine
      @wine = Wine.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def wine_params
      params.require(:wine).permit(:short_description, :bottle_size, :price, :long_description, :origin_country, :company, :grape_type, :is_vegetarian, :picture_id, :quantity)
    end
end
