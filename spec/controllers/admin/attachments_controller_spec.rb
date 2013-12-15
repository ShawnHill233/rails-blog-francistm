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

    it "PUT #update"

    it "POST #create" do
      attachment = build(:attachment, file_key: "attachment.jpg")
      upload_file = Rack::Test::UploadedFile.new(Rails.root.join("spec", "files", "attachment.jpg"), "image/jpg")
      post :create, format: :json,
                    file: upload_file,
                    attachment: attachment

      expect(response.body).to eq attachment.to_json
    end

    it "DELETE #destroy"
  end
end
