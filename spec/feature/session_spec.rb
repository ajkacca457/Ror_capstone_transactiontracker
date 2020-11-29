require 'rails_helper'

RSpec.feature 'Transactions', type: :feature do
  it 'checks a user is created' do
    visit '/users/sign_up'
    fill_in 'username', with: 'mytest5'
    fill_in 'Email', with: 'testing5@gmain.com'
    fill_in 'Enter your Password', with: 'testing5'
    fill_in 'Re-enter password', with: 'testing5'
    click_button 'Sign up'
    expect(page).to have_content('Welcome back!')
  end

  it 'checks a successful user login' do
    visit '/users/sign_up'
    fill_in 'username', with: 'mytest5'
    fill_in 'Email', with: 'testing5@gmain.com'
    fill_in 'Enter your Password', with: 'testing5'
    fill_in 'Re-enter password', with: 'testing5'
    click_button 'Sign up'
    click_on 'log out'
    visit 'sign_in'
    fill_in 'Email', with: 'testing5@gmain.com'
    fill_in 'Enter your Password', with: 'testing5'
    click_button 'Sign in'
    expect(page).to have_content('Welcome back!')
  end
end
