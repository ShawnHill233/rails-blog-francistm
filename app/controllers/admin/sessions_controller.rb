#encoding: utf-8
class Admin::SessionsController < AdministratorController

  layout "bootstrap-login"
  skip_before_filter :require_login, except: [:destroy]

  def new
  end

  def create
    username = params[:session][:username]
    password = params[:session][:password]

    if login(username, password)
      flash[:success] = "登录成功"
      redirect_to admin_path
    else
      flash[:error] = "登录失败，用户名/密码错误"
      redirect_to admin_login_path
    end
  end

  def destroy
    logout
    flash[:success] = "注销成功"
    redirect_to admin_login_path
  end
end
