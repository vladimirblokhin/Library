class Book < ActiveRecord::Base

  has_and_belongs_to_many :authors
  has_many :comments
  has_many :user_books

  validates :title, presence: true
  validates :title, uniqueness: true

  accepts_nested_attributes_for :authors


  mount_uploader :image, ImageUploader

  ratyrate_rateable 'rating'
end
