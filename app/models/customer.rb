class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :reviews, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :fovorites, dependent: :destroy

  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |customer|
      customer.name = "ゲスト"
      customer.password = SecureRandom.urlsafe_base64
    end
  end
end
