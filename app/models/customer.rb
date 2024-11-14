class Customer < ApplicationRecord
  # Devise modules for authentication
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Associations
  has_many :orders, dependent: :destroy

  # Validations
  validates :first_name, presence: true
  validates :last_name, presence: true
end
