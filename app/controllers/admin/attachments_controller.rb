#encoding: utf-8
class Admin::AttachmentsController < AdministratorController
  def edit
    @attachment = Attachment.find params[:id]
  end

  def show
  end

  def index
    @attachments_grid = initialize_grid(Attachment,
                                        include: :user,
                                        order: "created_at"
                                       )
  end

  def create
    @attachment = Attachment.new params[:attachment]
    @attachment.user_id = current_user.id

    upload_result = false
    create_result = false

    if @attachment.valid?
      upload_result = Qiniu::RS.upload_file uptoken: upload_token,
                                            file: params[:file].path,
                                            key: @attachment.file_key,
                                            bucket: Settings.qiniu[:bucket_name]
    end

    if upload_result
      create_result = @attachment.save
    end

    respond_to do |format|
      format.json do
        render json: create_result ? @attachment : nil
      end
    end
  end

  def update
    @attachment = Attachment.find params[:id]

    result = Qiniu::RS.move Settings.qiniu[:bucket_name],
                            @attachment.file_key,
                            Settings.qiniu[:bucket_name],
                            params[:attachment][:file_key]

    if result
      @attachment.update_attributes params[:attachment]
      flash[:success] = "文件更新成功"
      redirect_to admin_attachments_path
    else
      flash[:danger] = "文件更新失败，请重试"
      render "edit"
    end
  end

  def destroy
    @attachment = Attachment.find params[:id]

    rs_result = Qiniu::RS.delete Settings.qiniu[:bucket_name],
                                 @attachment.file_key

    if rs_result
      @attachment.destroy
      flash[:success] = "文件删除成功"
    else
      flash[:danger] = "文件删除失败，请重试"
    end
    redirect_to admin_attachments_path
  end

  protected

  def upload_token
    Qiniu::RS.generate_upload_token scope: Settings.qiniu[:bucket_name]
  end
end
