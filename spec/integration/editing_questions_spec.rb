require 'spec_helper'

feature "Editing Questions" do
  before do
    ques = Factory(:question, title: "What is the speed of an swallow?")
    visit '/'
    click_link ques.title
    click_link "Edit Question"
  end

  scenario "Updating a Question" do
    fill_in "I want to know...", 
        with: "What is the speed of an unladen swallow?"
    click_button "Update Question"
    page.should have_content("Question has been updated.")
  end

  scenario "Updating a question with invalid attributes is bad" do
    fill_in "I want to know...", with: ""
    click_button "Update Question"
    page.should have_content("Question has not been updated.")
  end    
end
