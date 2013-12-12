#encoding: utf-8
class Admin::EntriesController < AdministratorController
  def new
    @entry = Entry.new
  end

  def edit
    @entry = Entry.find_by_slug params[:id]
  end

  def index
    @entries_grid = initialize_grid Entry
  end

  def create
    @entry = current_user.entries.build params[:entry]

    if @entry.valid? and @entry.save
      flash[:success] = "创建日志成功"
      redirect_to admin_entries_path
    else
      flash.now[:danger] = "创建日志失败"
      render "new"
    end
  end

  def update
    @entry = Entry.find_by_slug params[:id]

    if @entry.update_attributes(params[:entry])
      flash[:success] = "日志更新成功"
      redirect_to admin_entries_path
    else
      flash.now[:error] = "日志更新失败"
      render "edit"
    end
  end

  def destroy
    @entry = Entry.find_by_slug params[:id]

    if @entry.destroy
      flash[:success] = "日志删除成功"
    else
      flash[:danger] = "日志删除失败"
    end

    redirect_to admin_entries_path
  end
end
