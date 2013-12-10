require 'spec_helper'

describe Attachment do
  context "CRUD test" do
    it "will valid" do
      expect(build(:attachment)).to be_valid
    end

    it "will invalid without user" do
      expect(build(:attachment, :user => nil)).to have(1).errors_on(:user)
    end

    it "will invalid without file_key" do
      expect(build(:attachment, :file_key => nil)).to have(1).errors_on(:file_key)
    end
  end
end
