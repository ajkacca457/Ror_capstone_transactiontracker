require 'rails_helper'

# rspec spec/views/user_spec.rb
RSpec.describe 'Create a transaction', type: :system do
  let(:user) { User.create(username: 'mytest3', email: 'testing3@gmail.com',
              password: 'testing3', password_confirmation: 'testing3')}

  describe 'create transaction' do
    it 'creats a transaction' do
      visit new_user_session_path
      fill_in 'Email', with: user.email
      fill_in 'Enter your Password', with: user.password
      click_button 'Sign in'
      find('a', text: ' Create New Transaction').click
      fill_in('Title', with: 'this is an example post')
      fill_in 'Amount', with: "200"
      click_on('Submit')
      expect(page).to have_content('External Transactions')
    end
  end
end
