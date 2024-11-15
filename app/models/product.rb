class Product < ApplicationRecord
    has_many_attached :images
    has_many :order_items, dependent: :destroy
    has_many :orders, through: :order_items
    has_many :product_categories, dependent: :destroy
    has_many :categories, through: :product_categories
  
    validates :name, presence: true
    validates :price, presence: true, numericality: { greater_than: 0 }
  
    def self.ransackable_attributes(auth_object = nil)
      ["id", "name", "description", "price", "stock_quantity", "created_at", "updated_at"]
    end
  end
  