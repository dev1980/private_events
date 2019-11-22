require "rails_helper"

require 'rails_helper'

RSpec.describe 'signup', type: :feature do
  scenario 'Should be a valid sign up' do
    visit signup_path
    fill_in "Name", with: 'Brham'
    sleep(5)
    # users = User.all.count
    click_button 'Create my account'
    # new_user = User.all.count
    expect(page).to have_content('Brham')
    expect{User.increment}.to change{User.count}.by(2)
  end
end