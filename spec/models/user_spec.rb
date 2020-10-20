require 'rails_helper'

RSpec.describe User, type: :model do

  describe '#create user' do
    it 'ensures user is created when passwords match' do
      @user = User.new(first_name: "Jennifer", last_name: "Bain", email: "jenny@mail.com", password: "butts", password_confirmation: "butts")
      @user.save
      expect(@user).to be_valid
    end

    it 'ensures user is not created when passwords do not match' do
      @user = User.new(first_name: "Jennifer", last_name: "Bain", email: "jenny@mail.com", password: "butts!!!", password_confirmation: "butts")
      @user.save
      # puts @user.errors.full_messages
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'ensures email is unique to one user' do
      @user1 = User.new(first_name: "Jennifer", last_name: "Bain", email: "jenny@mail.com", password: "butts", password_confirmation: "butts")
      @user1.save

      @user2 = User.new(first_name: "Jennifer", last_name: "Bain", email: "JennY@mail.com", password: "butts", password_confirmation: "butts")
      @user2.save
      # puts @user2.errors.full_messages
      expect(@user1).to be_valid
      expect(@user2).to_not be_valid
      expect(@user2.errors.full_messages).to include("Email has already been taken")
    end

  end
end
