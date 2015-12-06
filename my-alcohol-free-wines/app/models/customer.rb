class Customer < ActiveRecord::Base
  # Class to represent a Customer wishing to buy wine from MAF
  # This is required for bcrypt third party gem so that password can be stored securely
  has_secure_password
end
