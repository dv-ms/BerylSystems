# frozen_string_literal: true

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  $isadmin = true

  def isAdmin
    return true if cookies[:admin] == 'abc'

    false
  end
end
