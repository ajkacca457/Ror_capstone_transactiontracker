require 'rails_helper'

RSpec.describe 'Session pages', type: :feature do
  let(:user) do
    User.create(username: 'mytest5', email: 'testing5@gmail.com',
                password: 'testing5', password_confirmation: 'testing5')
  end
  scenario 'login' do
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Enter your Password', with: user.password
    click_button 'Sign in'
    expect(page).to have_content('Welcome back!')
  end

  scenario 'signup page' do
    visit new_user_registration_path
    fill_in 'username', with: 'mytest5'
    fill_in 'Email', with: 'testing5@gmain.com'
    fill_in 'Enter your Password', with: 'testing5'
    fill_in 'Re-enter password', with: 'testing5'
    click_button 'Sign up'
    expect(page).to have_content('Welcome back!')
  end
end
