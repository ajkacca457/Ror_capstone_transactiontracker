require 'rails_helper'

RSpec.feature 'Groups', type: :feature do
  it 'checks a group is created' do
    visit '/users/sign_up'
    fill_in 'username', with: 'testbot'
    fill_in 'Email', with: 'testbot1@gmail.com'
    fill_in 'Enter your Password', with: 'testingbot'
    fill_in 'Re-enter password', with: 'testingbot'
    click_button 'Sign up'
    find('a', text: ' Create New Transaction').click
    click_on('Create group')
    expect(page).to have_content('Create New Group')
  end

  it 'checks a group is created' do
    visit '/users/sign_up'
    fill_in 'username', with: 'testbot'
    fill_in 'Email', with: 'testbot1@gmail.com'
    fill_in 'Enter your Password', with: 'testingbot'
    fill_in 'Re-enter password', with: 'testingbot'
    click_button 'Sign up'
    find('a', text: ' Create New Transaction').click
    click_on('Create group')
    click_on('Submit')
    expect(page).to have_content("Title can't be blank")
  end


end
