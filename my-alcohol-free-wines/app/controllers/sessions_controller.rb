class SessionsController < ApplicationController
  def new
  end

  # Function create: Creates a session for a customer when they log in (does the logging in).
  # To be run when the customer enters their username and password into the form on the
  # login page.
  # Takes the email address and password entered by the customer in the login view and
  # tries to find the email in the customers table. If it is found, and the password
  # matches the hashed one (done by the bcrypt gem) in the table, a session is created (the
  # customer is logged in). They are then redirected to the wines index page.
  #
  # This function is adapted from the examples given in the online book "The Ruby on Rails
  # Tutorial" (3rd edition) by Michael Hartl, which is available online at
  # https://www.railstutorial.org/book/log_in_log_out (accessed 30 Nov 2015)
  def create
    # Try and find the email given in the login view in the customers table using
    # ActiveRecord. Email given by customer is converted to lowercase to do case insensitive
    # string matching.
    customer_logging_in = Customer.find_by(email: params[:session][:email].downcase)

    # Check the email address was found and that the password matches the hashed one in the database
    # and if it does, create a session (log them in) and redirect them to the wines index page
    if customer_logging_in && customer_logging_in.authenticate(params[:session][:password])
      log_in(customer_logging_in)
      redirect_to(wines_path)
    else
      # If the customer couldn't be found or the email and password combination was wrong, redirect
      # them to the login page and display an error message explaining what went wrong
      flash[:danger] = 'Customer with that email address and password combination could not be found'
      render 'new'
    end
  end
  
  # Called when the customer clicks a log out button - destroys the customer's session.
  #
  # This function is taken from Michael Hartl's "The Ruby on Rails Tutorial" (3rd edition) online book,
  # available at https://www.railstutorial.org/book/log_in_log_out (accessed: 30 Nov 2015)
  def destroy
      logout()
      redirect_to(wines_path)
  end
end
