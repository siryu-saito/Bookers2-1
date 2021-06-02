class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  validates :name, uniqueness: true, length: { in: 2..20 }
  validates :introduction, length: { maximum: 50 }
  
  has_many :books, dependent: :destroy
  has_many :favorites
  attachment :profile_image
  
  def liked_by?(post_id)
    favorites.where(post_id: post_id).exists
  end
  
end
