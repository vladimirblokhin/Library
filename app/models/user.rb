class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :comments
  has_many :user_book
  has_many :rates

  validates :login, presence: true,  length: {maximum: 40}
  validates :login, uniqueness: true

end
