class Rate < ActiveRecord::Base
  belongs_to :user
  belongs_to :book

  validates :book, presence: true
  validates :rating, presence: true
  validates :rating, numericality: { only_integer: true, greater_than: 0, less_than_or_equal_to: 5}
  validates :user, uniqueness: {scope: :book_id}
end
