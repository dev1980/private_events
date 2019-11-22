# frozen_string_literal: true

require 'rails_helper'
RSpec.describe 'signup', type: :feature do
  scenario 'Should be a valid signup' do
    visit signup_path
    fill_in('Name', with: 'Brham')
    click_button 'Create my account'
    expect(page).to have_content('Brham')
  end
end

RSpec.describe 'the signin process', type: :feature do
  before :each do
    User.create(name: 'Brham')
  end
  it 'Login' do
    visit login_path
    fill_in 'Name', with: 'Brham'
    click_button 'Login'
    expect(page).to have_content 'Brham'
  end
end
