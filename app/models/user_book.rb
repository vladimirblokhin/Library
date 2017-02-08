class UserBook < ActiveRecord::Base
  belongs_to :user
  belongs_to :book

  validates :user, presence: true
  validates :book, uniqueness: {scope: :user_id}
  validates :list_type, presence: true
end
