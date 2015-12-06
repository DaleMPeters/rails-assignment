module SessionsHelper

  # Function to be called when the customer enters correct login details
  # (an email address and a password that matches one in the customers table).
  # Sets the 'customer_id' key in the sessions hash to the id number of the
  # customer (from the database).
  #
  # This function is adapted from examples in Michael Hartl's online book "Ruby on Rails
  # Tutorial" 3rd edition, available online at https://www.railstutorial.org/book/log_in_log_out
  # (accessed 30 Nov 2015)
  def log_in(customer)
    session[:customer_id] = customer.id
  end

  # Function to get an object representing the currently logged in customer.
  #
  # Checks if there is no logged in customer and if there isn't one, tries to find
  # the row representing the customer in the customers table by their customer id.
  # If there is one, it is set to @logged_in_customer and logged_in_customer is returned.
  #
  # This function is adapted from examples given in Michael Hartl's online book
  # "Ruby on Rails Tutorial" 3rd edition, available online at 
  # https://www.railstutorial.org/book/log_in_log_out (accessed 30 Nov 2015)
  def logged_in_customer
    # Check if, at the moment, there is no customer logged in by checking if
    # it is not equal to nil
    if @logged_in_customer.nil?
      # If it isn't, try and find them in the database by their customer id
      @logged_in_customer = Customer.find_by(id: session[:customer_id])
    end
    # Return the object representing the logged in customer
    @logged_in_customer
  end
  
  # Function to check if there is a customer currently logged in
  #
  # This function is adapted from examples given in Michael Hartl's online
  # book "Ruby on Rails Tutorial" 3rd edition, available online at
  # https://www.railstutorial.org/book/log_in_log_out (accessed 30 Nov 2015)
  def customer_is_logged_in?
    logged_in_customer != nil
  end

  # Function to log the user out (destroy the session). Checks if there is a customer
  # logged in and if there is, delete the customer_id key and value from the session
  # hash. Then set the logged_in_customer variable to nil.
  #
  # Function adapted from examples given in Michael Hartl's online book "Ruby on 
  # Rails Tutorial" 3rd edition, available online at
  # https://www.railstutorial.org/book/log_in_log_out (accessed 30 Nov 2015)
  def logout
    # If there is a customer logged in
    if customer_is_logged_in?
      # Delete the customer_id key and value from the session hash
      session.delete(:customer_id)
      logged_in_customer = nil
    end
  end
end
