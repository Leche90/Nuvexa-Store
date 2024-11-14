Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  authenticated :admin_user do
    root to: "admin/dashboard#index", as: :authenticated_admin_root
  end

  # Define the default root path if no other root is specified for other users
  root to: "home#index" # or another main page controller you have set up
end
