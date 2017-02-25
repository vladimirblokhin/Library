class Book < ActiveRecord::Base

  has_and_belongs_to_many :authors
  has_many :comments
  has_many :user_books
  has_many :readers, through: :user_books, source: :user

  validates :title, presence: true
  validates :title, uniqueness: true
  validates :image, presence: true
  validates :book_authors, presence: true

  mount_uploader :image, ImageUploader

  ratyrate_rateable 'rating'
end
