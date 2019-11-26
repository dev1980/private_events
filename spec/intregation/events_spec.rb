# frozen_string_literal: true

require 'rails_helper'
RSpec.describe 'Content of the event pages', type: :feature do
  scenario 'index page' do
    visit root_path
    expect(page).to have_content('All Events')
  end
end
