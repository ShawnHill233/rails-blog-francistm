require 'spec_helper'

describe Entry do
  context "CRUD test" do
    it "valid" do
      expect(build(:entry)).to be_valid
    end

    it "invalid without slug" do
      expect(build(:entry, :slug => nil)).to have(1).errors_on(:slug)
    end

    it "invalid without user" do
      expect(build(:entry, :user => nil)).to have(1).errors_on(:user)
    end

    it "invalid without title" do
      expect(build(:entry, :title => nil)).to have(1).errors_on(:title)
    end

    it "invalid without content" do
      expect(build(:entry, :content => nil)).to have(1).errors_on(:content)
    end
  end
end
