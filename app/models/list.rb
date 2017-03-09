class List < ActiveRecord::Base
  belongs_to :user
  belongs_to :book

  validates :book, presence: true
  validates :user, uniqueness: {scope: :book_id}
  validates :list_type, presence: true
end
