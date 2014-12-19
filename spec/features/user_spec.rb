require 'rails_helper'

feature 'User' do

  before { @user = create(:user) }

  scenario 'signs up for account' do
      visit new_user_path
      fill_in 'Name', with: Faker::Name.name
      fill_in 'Email', with: Faker::Internet.email
      fill_in 'Password', with: 'welcome'
      fill_in 'Password confirmation', with: 'welcome'
      click_button 'Sign Up'
      expect( page ).to have_content('Thank you for signing up!')
  end

  scenario 'logs in to existing account' do
    visit login_path
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_button 'Log In'
    expect( page ).to have_content('Logged in!')
  end

  scenario 'enters incorrect credentials' do
    visit login_path
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: 'wrongpassword'
    click_button 'Log In'
    expect( page ).to have_content('Email or password is invalid')
  end
end