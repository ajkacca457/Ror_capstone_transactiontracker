require 'rails_helper'
RSpec.describe User, type: :model do
  let(:user_password) { User.new(username: 'test1', password: 'test123', password_confirmation: 'test12') }
  let(:invalid_username) { User.new(password: 'test123', password_confirmation: 'test123') }
  let(:invalid_password) { User.new(username: 'test1', password_confirmation: 'test123') }

  context 'Association Test' do
    it 'has many transactions' do
      expect(User.reflect_on_association(:transactions).macro).to be :has_many
    end

    it 'has many groups ' do
      expect(User.reflect_on_association(:groups).macro).to be :has_many
    end

  end

  context 'Validation tests' do
    it 'ensures that password matches with password confirmation' do
      expect(user_password.save).to eq(false)
    end

    it 'ensure username is invalid if username is not given' do
      expect(invalid_username.valid?).to eq(false)
    end

    it 'ensure password is invalid if password is not given' do
      expect(invalid_password.valid?).to eq(false)
    end
  end
end
