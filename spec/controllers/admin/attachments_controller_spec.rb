require 'spec_helper'

describe Admin::AttachmentsController do
  context "will render correct views" do
    it "GET #show"

    it "GET #index" do
      get :index
      expect(response).to render_template "index"
    end

    it "POST #create"
    it "DELETE #destroy"
end
