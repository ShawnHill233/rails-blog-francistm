require 'spec_helper'

describe Admin::SettingsController do
  before :each do
    login_user create(:user)
  end

  context "Stat test" do
    let :test_code do
      "this is test code for Stat setting"
    end

    it "GET #stat" do
      get :stat
      expect(response).to render_template "stat"
    end

    it "PUT #stat_update" do
      put :stat_update, stat: { code: test_code }
      expect(response).to redirect_to admin_settings_stat_path
      expect(Stat.code).to eq test_code
    end
  end
end
