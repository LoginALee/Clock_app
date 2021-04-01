require 'rails_helper'

RSpec.feature 'User sign ins', type: :feature do
  let!(:user) { create(:user) }
  let(:invalid_user) { build(:user) }

  background do
    visit new_user_session_path
  end

  scenario 'with valid user' do
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_on 'Log in'
    expect(page).to have_content('Signed in successfully.')
    expect(current_path).to eq(root_path)
  end

  scenario 'with invalid user' do
    fill_in 'Email', with: invalid_user.email
    fill_in 'Password', with: invalid_user.password
    click_on 'Log in'
    expect(page).to have_content('Invalid Email or password.')
    expect(current_path).to eq(new_user_session_path)
  end

  scenario 'with a blank field' do
    fill_in 'Email', with: user.email
    click_on 'Log in'
    expect(page).to have_content('Invalid Email or password.')
    expect(current_path).to eq(new_user_session_path)
  end
end
