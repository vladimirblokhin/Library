class Book < ActiveRecord::Base

  has_and_belongs_to_many :authors
  has_many :comments
  has_many :lists
  has_many :readers, through: :lists, source: :user
  has_many :rates
  has_many :appraisers, through: :rates, source: :user

  validates :title, presence: true
  validates :title, uniqueness: true
  validates :image, presence: true
  validates :book_authors, presence: true
  validates :description, presence: true
  validates :description, length: {maximum: 700}

  mount_uploader :image, ImageUploader
end
