class AdminUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :validatable
  
  def self.ransackable_attributes(auth_object = nil)
    # Allow only the necessary and safe attributes for search
    ["confirmation_sent_at", "confirmation_token", "confirmed_at", "created_at", "email", "id", "remember_created_at", "reset_password_sent_at", "updated_at"]
  end
end
