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
  end

  def update
  end

  def destroy
  end
end
