#encoding: utf-8

class Admin::SettingsController < AdministratorController
  def stat
    @stat = Stat
  end

  def stat_update
    @stat = Stat
    @stat.code = params[:stat][:code]

    flash[:success] = "统计代码更新成功"
    redirect_to admin_settings_stat_path
  end
end
