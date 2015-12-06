class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
 
  # Include the sessions helper so that we can access the data contained
  # in the session hash
  include SessionsHelper
  
  # Function to get the user's basket from the session hash. Looks for a basket
  # with the same basket_id (from the baskets table) as the one in the session hash.
  #
  # If one cannot be found, a basket is created and the basket_id in the session
  # hash is set to the new basket's basket_id.
  #
  # This function is based on the examples given in "Agile Web Development with
  # Rails" 4th edition by Sam Ruby et al. (chapter 9).
  def get_user_basket
    Basket.find(session[:basket_id])
  rescue ActiveRecord::RecordNotFound
    # Look for a basket record in the baskets table with the same id as the basket_id
    # in the session hash
    if !session[:basket_id].nil?
      basket = Basket.find(session[:basket_id])
      basket
    end  
    # if one can't be found, create one and set the basket_id in the session to the id of the
    # new basket and return it
    if basket.nil?
      basket = Basket.create()
      session[:basket_id] = basket.id
      basket
    end
  end
end
