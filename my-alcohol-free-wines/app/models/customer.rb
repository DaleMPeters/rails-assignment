class Customer < ActiveRecord::Base
  # REFERENCE: https://www.railstutorial.org/book/modeling_users
  has_secure_password
end
