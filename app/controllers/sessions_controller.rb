# REFERENCE: https://www.railstutorial.org/book/log_in_log_out

class SessionsController < ApplicationController
  def new
  end

  def create
    customer_logging_in = Customer.find_by(email: params[:session][:email].downcase)
    if customer_logging_in && customer_logging_in.authenticate(params[:session][:password])
      log_in(customer_logging_in)
      redirect_to(wines_path)
    else
      flash[:danger] = 'Invalid email and password combination'
      render 'new'
    end
  end

  def destroy
      logout
      redirect_to wines_path
  end
end
