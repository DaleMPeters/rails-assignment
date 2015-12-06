class WinesController < ApplicationController
  
  # Use rest_client gem to get the Wines from the third party suppliers
  require 'rest_client'

  # Define constant to contain the wines URL for the first web service
  WINES_SUPPLIER_1_URL = "http://localhost:5000/wines/"

  # Define constant to contain the wines URL for the second web service
  WINES_SUPPLIER_2_URL = "http://localhost:5001/wines/"

  before_action :set_wine, only: [:show, :edit, :update, :destroy]

  # GET /wines
  # GET /wines.json
  #
  # Method to be run when a GET request is made to wines_path.
  #
  # Makes a request to the web service and retrieves a JSON list of all the wines
  # sold by the supplier. Result is parsed to JSON and the JSON is looped over.
  # Each wines is looked for by barcode in the database and if it isn't in the data
  # base already, it is added. All the wines are then passed to the wine index view
  # so that the user can see them.
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

    # Make a GET request to the URL using the third party gem "rest_client"
    raw_response = RestClient.get(WINES_SUPPLIER_1_URL)

    # Convert the result of the request to JSON
    jsonised_response = JSON.parse(raw_response)

    # For each item in the received JSON
    for item in jsonised_response['wines'] do
      
      # Try and find the current wine from the JSON object in the wines table by
      # looking for one with an identical barcode
      result_wine = Wine.find_by(barcode: item['barcode'])

      # if the resultant wine is nil, that means none were found and we need to add it to
      # the wines tables, with all the other information
      if result_wine == nil
        # Create new wine object and set its attributes to those from the JSON object
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

        # Save the wine to the database table when the attributes have been set
        new_wine.save
      end
    end
    
    # Now look for the wines needed, passing the search query from the view to the Wine model 
    @wines = Wine.search(params[:search_query]).order(:short_description).paginate(page: params[:page], per_page: 10)
  end

  # GET /wines/1
  # GET /wines/1.json
  #
  # Method to be run when a GET request is made to wines_path/<wine_id>
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
