class Post < ApplicationRecord

  belongs_to :user
  has_many :comments
  has_many :gears, dependent: :destroy
  accepts_nested_attributes_for :gears,allow_destroy: true

  validates :image, presence: true
  
  #postsテーブルに対して、画像アップロードを可能にするためマウント
  mount_uploader :image, ImageUploader
end
