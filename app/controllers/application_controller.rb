# app/controllers/application_controller.rb
class ApplicationController < ActionController::Base
    # Redirects to the login page if an AdminUser is not signed in
    def authenticate_admin_user!
      unless current_admin_user
        redirect_to new_admin_user_session_path, alert: "Please log in to access the admin dashboard."
      end
    end
  end
  