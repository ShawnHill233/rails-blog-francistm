#encoding: utf-8
class Admin::AttachmentsController < AdministratorController
  def edit
    @attachment = Attachment.find params[:id]
  end

  def show
  end

  def index
    @attachments_grid = initialize_grid Attachment, include: :user, order: "created_at"
  end

  def create
    @attachment = Attachment.new params[:attachment]
    @attachment.user_id = current_user.id

    respond_to do |format|
      if @attachment.valid? and @attachment.save
        format.json { render json: @attachment }
      else
        format.json { render json: nil }
      end
    end
  end

  def update
    @attachment = Attachment.find params[:id]

    if @attachment.update_attributes(params[:attachment])
      flash[:success] = "文件更新成功"
      redirect_to admin_attachments_path
    else
      flash[:danger] = "文件更新失败，请重试"
      render "edit"
    end
  end

  def destroy
    @attachment = Attachment.find params[:id]

    if @attachment.destroy
      flash[:success] = "文件删除成功"
    else
      flash[:danger] = "文件删除失败，请重试"
    end

    redirect_to admin_attachments_path
  end
end
