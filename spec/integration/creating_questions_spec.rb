require 'spec_helper'

feature 'Creating Questions' do
  scenario 'can create a question' do
    visit '/'
    click_link 'New Question'
    fill_in 'I want to know...', with: "How old is the Universe?"
    click_button 'Create Question'
    page.should have_content('Question has been created.')
  end

  scenario 'page title is based on Question Name' do
    visit '/'
    click_link 'New Question'
    fill_in 'I want to know...', with: "How old is the Universe?"
    click_button 'Create Question'
    page.should have_content('Question has been created.')

    question = Question.find_by_title("How old is the Universe?")
    page.current_url.should == question_url(question)
    title = "How old is the Universe? - Question - Knowledge Base"
    find('title').should have_content(title)
  end    
end
