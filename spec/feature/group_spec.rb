require 'rails_helper'

# rspec spec/views/user_spec.rb
RSpec.describe 'Create a group', type: :system do
  let(:user) do
    User.create(username: 'mytest3', email: 'testing3@gmail.com',
                password: 'testing3', password_confirmation: 'testing3')
  end

  describe 'create group' do
    it 'creats a group' do
      visit new_user_session_path
      fill_in 'Email', with: user.email
      fill_in 'Enter your Password', with: user.password
      click_button 'Sign in'
      find('a', text: ' Create New Transaction').click
      click_on('Create group')
      fill_in('Title', with: 'this is another')
      fill_in 'Icon', with: 'Ö'
      click_on('Submit')
      expect(page).to have_content('All Groups')
    end
  end
end
