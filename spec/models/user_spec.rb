require 'rails_helper'

RSpec.describe User, :type => :model do
  context "User-name validation" do
    it "must be valid" do
      user = User.new(name: 'John Doe', email: 'johndoe@email.com')
      expect(user).to be_valid
  end

    it "is not valid" do
      user = User.new(email: 'johndoe@email.com')
      expect(user).to_not be_valid
    end

    it "is not blank, empty field" do
      user = User.new(name: nil)
      user.valid?
      expect(user.errors[:name]).to include("can't be blank")
    end
  end

  context "User-email validation" do
    it "must be valid" do
      user = User.new(name: 'John Doe', email: 'johndoe@email.com')
      expect(user).to be_valid
  end

    it "is not valid" do
      user = User.new(name: 'John Doe')
      expect(user).to_not be_valid
    end
  end
end
