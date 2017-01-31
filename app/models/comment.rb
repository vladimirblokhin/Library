class Comment < ActiveRecord::Base
  belongs_to :book
  belongs_to :user

  validates :book, presence: true
  validates :body, presence: true
end
