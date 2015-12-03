class OrdersController < ApplicationController
  require 'rest_client'
  def create
    order = {
      'customer_name' => logged_in_customer.name,
      'customer_address' => logged_in_customer.address,
      'customer_email' => logged_in_customer.email,
      'wine_barcode' => "1234",
      'quantity' => 5
    }

    jsonified_order = order.to_json()
    RestClient.post('http://localhost:5001/orders/', jsonified_order,
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

    redirect_to wines_path
  end

  def new
  end

  def order_params
    params.require(:customer_name, :customer_address, :customer_email,
                  :wine_barcode, :quantity)
  end
end
