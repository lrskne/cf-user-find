class User < ActiveRecord::Base
  validates :email, format: { with:  /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/, message: "So sorry, your email format is invalid" }

  validates :name, presence: true
end
