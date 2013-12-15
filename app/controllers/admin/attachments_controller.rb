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

    create_result = false
    upload_result = Qiniu::RS.upload_file uptoken: upload_token,
                                          file: @attachment.file,
                                          bucket: Settings.qiniu[:bucket_name],
                                          key: @attachment.file_key
    if upload_result
      create_result = @attachment.save
    end

    respond_to do |format|
      format.json do
        if upload_result
          render json: @attachment
        else
          render json: [nil]
        end
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
  end

  protected

  def upload_token
    Qiniu::RS.genrate_upload_token scope: Settings.qiniu[:bucket_name],
                                   customer: current_user.id
  end
end
