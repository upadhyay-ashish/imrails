class User < ActiveRecord::Base
  validates_presence_of :firstname ,:lastname  ,:username ,:email ,:password ,:address ,:phone_number,:role
  validates_numericality_of :phone_number
end
