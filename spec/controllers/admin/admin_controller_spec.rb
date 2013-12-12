require 'spec_helper'

describe Admin::AdminController do
  before :each do
    @user = create(:user)
    login_user @user
  end

  context "will render correct views" do
    it "GET #index" do
      get :index
      expect(response).to render_template "index"
    end
  end
end
