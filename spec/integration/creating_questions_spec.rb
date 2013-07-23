require 'spec_helper'

feature 'Creating Questions' do
  before do
    visit '/'
    user = Factory(:user, email: "bob@bob.com")
    click_link 'New Question'

    message = "You need to sign in or sign up before continuing."
    page.should have_content(message)

    sign_in_as!(user)
    page.should have_content("Signed in as bob@bob.com")
  end

  scenario 'can create a question' do
    fill_in 'I want to know...', with: "How old is the Universe?"
    click_button 'Create Question'
    page.should have_content('Question has been created.')
    within("#contributor") do
      page.should have_content("bob@bob.com")
    end
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
