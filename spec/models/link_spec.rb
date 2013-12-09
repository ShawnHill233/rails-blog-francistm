require 'spec_helper'

describe Link do
  context "CRUD test" do
    it "valid" do
      expect(build(:link)).to be_valid
    end

    it "invalid without site_url" do
      expect(build(:link, :site_url => nil)).to have(1).errors_on(:site_url)
    end

    it "invalid without site_name" do
      expect(build(:link, :site_name => nil)).to have(1).errors_on(:site_name)
    end

    it "invalid if site_name duplicated" do
      link = create(:link)
      expect(build(:link, :site_name => link.name)).to have(1).errors_on(:site_name)
    end
  end
end
