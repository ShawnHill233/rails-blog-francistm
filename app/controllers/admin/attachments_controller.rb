class Admin::AttachmentsController < AdministratorController
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

  def destroy
  end
end
