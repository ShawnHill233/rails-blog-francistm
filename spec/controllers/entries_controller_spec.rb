require 'spec_helper'

describe EntriesController do
  context "will render correct views" do
    it "GET #show" do
      entry = create(:entry)
      get :show, :id => entry.slug
      expect(response).to render_template "show"
    end
  end
end
