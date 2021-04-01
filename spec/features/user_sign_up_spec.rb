require 'rails_helper'

RSpec.feature 'User sign ups', type: :feature do
  let!(:user) { create(:user) }
  let(:valid_user) { build(:user) }

  background do
    visit root_path
    click_on 'Sign up'
  end

  scenario 'with valid values' do
    fill_in 'Email', with: valid_user.email
    fill_in 'Password', with: valid_user.password
    fill_in 'Password confirmation', with: valid_user.password
    click_on 'Sign up'
    expect(page).to have_content('Welcome! You have signed up successfully.')
    expect(current_path).to eq(root_path)
  end

  scenario 'with email already taken' do
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    fill_in 'Password confirmation', with: user.password
    click_on 'Sign up'
    expect(page).to have_content('Email has already been taken')
    expect(current_path).to eq(user_registration_path)
  end

  scenario 'with a very short password' do
    short_password = Faker::Internet.password(min_length: 3, max_length: 5)
    user = build(:user, password: short_password)
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    fill_in 'Password confirmation', with: user.password
    click_on 'Sign up'
    expect(page).to have_content('Password is too short')
    expect(current_path).to eq(user_registration_path)
  end

  scenario 'with a within invalid password confirmation' do
    unmatching_password = Faker::Internet.password(min_length: 10)
    user = build(:user, password_confirmation: unmatching_password)
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    fill_in 'Password confirmation', with: user.password_confirmation
    click_on 'Sign up'
    expect(page).to have_content("Password confirmation doesn't match Password")
    expect(current_path).to eq(user_registration_path)
  end
end
