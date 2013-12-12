#encoding: utf-8

class AdministratorController < ActionController::Base
  layout "bootstrap"
  protect_from_forgery
  before_filter :require_login, expect: [:not_authenticated]

  def not_authenticated
    flash[:danger] = "需要登录授权才能访问"
    redirect_to admin_login_path
  end

end
