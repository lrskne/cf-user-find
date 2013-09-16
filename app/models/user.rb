class User < ActiveRecord::Base
  has_one :license
  accepts_nested_attributes_for :license, allow_destroy: true

  validates :email, format: { with:  /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/, message: "So sorry, your email format is invalid" }
  validates_uniqueness_of :email
  validates :name, presence: true
end
