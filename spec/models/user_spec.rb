require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
    it { should validate_presence_of(:password_digest) }
    it { should have_secure_password }
    it { should validate_presence_of(:password) }
    it { should validate_presence_of(:password_confirmation) }
    it { should validate_confirmation_of(:password).on(:create) }
  end

  it "should not store a users password" do
    user = User.create(email: 'pesto@fakeemail.com', password: 'password123', password_confirmation: 'password123')

    expect(user).to_not have_attribute(:password)
    expect(user.password_digest).to_not eq('password123')
  end

  describe 'class methods' do
    it "should generate random api key for a user" do
    end
  end
end
