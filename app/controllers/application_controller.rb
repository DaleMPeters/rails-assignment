class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  # REFERENCE: https://www.railstutorial.org/book/log_in_log_out
  include SessionsHelper

  # adapted from Agile Web Development with Rails
  def get_user_basket
    Basket.find(session[:basket_id])
  rescue ActiveRecord::RecordNotFound
    basket = Basket.create
    session[:basket_id] = basket.id
    basket
  end
end
