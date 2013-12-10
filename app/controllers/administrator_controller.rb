#encoding: utf-8

class AdministratorController < ActionController::Base
  layout "bootstrap"
  protect_from_forgery
  before_filter :require_login
end
