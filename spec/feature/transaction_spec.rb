require 'rails_helper'

RSpec.feature 'Transactions', type: :feature do
  it 'checks content when a transaction is created' do
    visit '/users/sign_up'
    fill_in 'username', with: 'testbot'
    fill_in 'Email', with: 'testbot1@gmail.com'
    fill_in 'Enter your Password', with: 'testingbot'
    fill_in 'Re-enter password', with: 'testingbot'
    click_button 'Sign up'
    find('a', text: ' Create New Transaction').click
    fill_in('Title', with: 'this is an example post')
    fill_in 'Amount', with: '200'
    click_on('Submit')
    expect(page).to have_content('External Transactions')
  end

  it 'checks transaction wont be created if title blank' do
    visit '/users/sign_up'
    fill_in 'username', with: 'testbot'
    fill_in 'Email', with: 'testbot1@gmail.com'
    fill_in 'Enter your Password', with: 'testingbot'
    fill_in 'Re-enter password', with: 'testingbot'
    click_button 'Sign up'
    find('a', text: ' Create New Transaction').click
    fill_in('Title', with: '')
    fill_in 'Amount', with: '200'
    click_on('Submit')
    expect(page).to have_content('Title is too short (minimum is 10 characters)')
  end

  it 'checks transaction wont be created if amount blank' do
    visit '/users/sign_up'
    fill_in 'username', with: 'testbot'
    fill_in 'Email', with: 'testbot1@gmail.com'
    fill_in 'Enter your Password', with: 'testingbot'
    fill_in 'Re-enter password', with: 'testingbot'
    click_button 'Sign up'
    find('a', text: ' Create New Transaction').click
    fill_in('Title', with: 'my title')
    fill_in 'Amount', with: ''
    click_on('Submit')
    expect(page).to have_content("Amount can't be blank")
  end

  end
