class OrdersController < ApplicationController
  # Class used to send orders off to a supplier
  
  # Define constant containing the URL for the web services
  # orders receiver
  SUPPLIERS_ORDERS_PATH = 'http://localhost:5000/orders/'

  # Need to import the third party ruby gem to do the POST request for the orders,
  # 'rest_client'
  require 'rest_client'

  # Creates an order hash ready to be sent off to the web service using information 
  # from the session. Wine barcode and quantity are hardcoded as I didn't have time 
  # to implement this
  def create
    order = {
      'customer_name' => logged_in_customer.name,
      'customer_address' => logged_in_customer.address,
      'customer_email' => logged_in_customer.email,
      'wine_barcode' => "1234",
      'quantity' => 5
    }

    # Convert the hash to a JSON object, so that it is in the form required by
    # the web service
    jsonified_order = order.to_json()
    RestClient.post(SUPPLIERS_ORDERS_PATH, jsonified_order,
                    :content_type => :json,
                    :accept => :json)
    # respond_to do |format|
    #   if checkout was successful
    #     empty_basket
    #     format.html { redirect_to wines_path, notice: 'Checkout was successful' }
    #   else
    #     format.html { redirect_to <BASKET>, notice: 'Checkout failed, please try again' }
    #   end
    # end

    # When the order has been sent, redirect the customer to the wines listing page
    redirect_to wines_path
  end

  def new
  end

  def order_params
    params.require(:customer_name, :customer_address, :customer_email, :wine_barcode, :quantity)
  end
end
