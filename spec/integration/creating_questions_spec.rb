require 'spec_helper'

feature 'Creating Questions' do
  scenario 'can create a question' do
    visit '/'
    click_link 'New Question'
    fill_in 'I want to know...', with: "How old is the Universe?"
    click_button 'Create Question'
    page.should have_content('Question has been created.')
  end
end
