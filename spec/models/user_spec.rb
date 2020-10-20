require 'rails_helper'

RSpec.describe User, type: :model do

  describe '#create user' do
    it 'ensures user is created when passwords match' do
      @user = User.new(first_name: "Jennifer", last_name: "Bain", email: "jenny@mail.com", password: "butts", password_confirmation: "butts")
      @user.save
      expect(@user).to be_valid
    end
  end
end
