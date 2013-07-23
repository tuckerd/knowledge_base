require 'spec_helper'

feature 'Creating Questions' do
  before do
    visit '/'
    click_link 'New Question'
  end

  scenario 'can create a question' do
    fill_in 'I want to know...', with: "How old is the Universe?"
    click_button 'Create Question'
    page.should have_content('Question has been created.')
  end

  scenario 'page title is based on Question Name' do
    fill_in 'I want to know...', with: "How old is the Universe?"
    click_button 'Create Question'
    question = Question.find_by_title("How old is the Universe?")
    page.current_url.should == question_url(question)
    title = "How old is the Universe? - Question - Knowledge Base"
    find('title').should have_content(title)
  end

  scenario "cannot create a question without content" do
    click_button 'Create Question'
    page.should have_content("Question has not been created.")
    page.should have_content("Title can't be blank")    
  end    
end
