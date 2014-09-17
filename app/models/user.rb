class User < ActiveRecord::Base
  has_secure_password

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, length: 8..20

  has_many :reviews, dependent: :destroy
  has_many :products
  has_many :reviewed_products, class_name: "Product", through: :reviews

end
