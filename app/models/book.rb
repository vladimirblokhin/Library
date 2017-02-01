class Book < ActiveRecord::Base

  has_many :comments

  validates :title, presence: true

  mount_uploader :image, ImageUploader

  ratyrate_rateable 'rating'
end
