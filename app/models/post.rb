class Post < ApplicationRecord

  belongs_to :user
  has_many :gears, dependent: :destroy

  # # postsテーブルにgearsテーブルをネストさせる処理
  # accepts_nested_attributes_for :gears

  #postsテーブルに対して、画像アップロードを可能にするためマウント
  mount_uploader :image, ImageUploader
end
