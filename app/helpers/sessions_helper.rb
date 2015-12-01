module SessionsHelper
  # REFERENCE https://www.railstutorial.org/book/log_in_log_out
  def log_in(customer)
    session[:customer_id] = customer.id
  end

  # REFERENCE https://www.railstutorial.org/book/log_in_log_out
  def logged_in_customer
    if @logged_in_customer.nil?
      @logged_in_customer = Customer.find_by(id: session[:customer_id])
    end
    @logged_in_customer
  end

  # REFERENCE AS ABOVE METHOD
  def customer_is_logged_in?
    logged_in_customer != nil
  end

  def logout
    if customer_is_logged_in?
      session.delete(:customer_id)
      logged_in_customer = nil
    end
    end
end
