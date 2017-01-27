class User < ActiveRecord::Base

  validates :login, presence: true
  validates :email, presence: true
end
