require 'spec_helper'

describe Admin::AttachmentsController do
  before :each do
    @user = create(:user)
    login_user @user
  end

  context "will render correct views" do
    it "GET #show" do
      attachment = create(:attachment)
      get :show, :id => attachment
      expect(response).to render_template "show"
    end

    it "GET #edit" do
      attachment = create(:attachment)
      get :edit, :id => attachment
      expect(response).to render_template "edit"
    end

    it "GET #index" do
      get :index
      expect(response).to render_template "index"
    end

    it "POST #create" do
      upload_file = Rack::Test::UploadedFile.new(Rails.root.join("spec", "files", "attachment.jpg"), "image/jpg")
      post :create, format: :json,
                    file: upload_file,
                    attachment: attributes_for(:attachment, file_key: "attachment.jpg")

      json_response = JSON.parse(response.body)
      expect(json_response["file_key"]).to eq "attachment.jpg"
    end

    it "PUT #update" do
      attachment = create(:attachment, file_key: "attachment.jpg")
      put :update, id: attachment, attachment: { file_key: "attachment-moved.jpg" }

      expect(response).to redirect_to admin_attachments_path
    end

    it "DELETE #destroy" do
      attachment = create(:attachment, file_key: "attachment-moved.jpg")
      delete :destroy, id: attachment

      expect(response).to redirect_to admin_attachments_path
    end
  end
end
