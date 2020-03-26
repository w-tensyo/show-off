class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts
  has_many :comments
  # フォロー機能のアソシエーション設定
  has_many :relationships
  has_many :followings, through: :relationships, source: :follow
  has_many :reverse_of_relationships, class_name: 'Relationship', foreign_key: 'follow_id'
  has_many :followers, through: :reverse_of_relationships, source: :user

  # DM機能のアソシエーション設定
  has_many :messages
  has_many :sent_messages, through: :messages, source: :receive_user
  has_many :reverses_of_message, class_name: 'Message', foreign_key: 'receive_user_id'
  has_many :received_messages, through: :reverses_of_message, source: :user

  #画像アップロードのgem、carrierwaveを導入。Userテーブルのprof_imageカラムに対してuploaderを可能にする
  mount_uploader :prof_image, ImageUploader

  def follow(other_user)
    unless self == other_user
      self.relationships.find_or_create_by(follow_id: other_user.id)
    end
  end

  def unfollow(other_user)
    relationship = self.relationships.find_by(follow_id: other_user.id)
    relationship.destroy if relationship
  end

  def following?(other_user)
    self.followings.include?(other_user)
  end
end
