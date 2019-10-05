# frozen_string_literal: true

class Admins::PasswordsController < Devise::PasswordsController
  include Accessible
  # GET /resource/password/new
  # def new
  #   super
  # end

  # POST /resource/password
  # def create
  #   super
  # end

  # GET /resource/password/edit?reset_password_token=abcdef
  # def edit
  #   super
  # end

  # PUT /resource/password
  def update
    super
    if resource.errors.empty?
      if Devise.sign_in_after_reset_password
        flash_message = resource.active_for_authentication? ? :updated : :updated_not_active
        if flash_message == :updated
          #send mail
          #not working
          puts "***************Password change successfull Successfull***************************"
          Sidekiq::Client.enqueue(EmailWorker, 6, resource.email, "Update password successful", "Admin password update successfull.")
        end
      else
      end
    else
    end
  end

  # protected

  # def after_resetting_password_path_for(resource)
  #   super(resource)
  # end

  # The path used after sending reset password instructions
  # def after_sending_reset_password_instructions_path_for(resource_name)
  #   super(resource_name)
  # end
end