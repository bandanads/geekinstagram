class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :tests, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_tests, through: :likes, source: :test
  has_many :comments, dependent: :destroy
  def already_liked?(test)
    self.likes.exists?(test_id: test.id)
  end
  validates :name, presence: true 
  validates :profile, length: { maximum: 200 }
end
