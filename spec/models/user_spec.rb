require 'spec_helper'

describe User do
  context "CRUD test" do
    it "valid" do
      expect(build(:user)).to be_valid
    end

    it "invalid without email" do
      expect(build(:user, :email => nil)).to have(1).errors_on(:email)
    end

    it "invalid without username" do
      expect(build(:user, :username => nil)).to have(1).errors_on(:username)
    end

    it "invalid if email duplicated" do
      user = create(:user)
      expect(build(:user, :email => user.email)).to have(1).errors_on(:email)
    end

    it "invalid if username duplicated" do
      user = create(:user)
      expect(build(:user, :username => user.username)).to have(1).errors_on(:username)
    end
  end
end
