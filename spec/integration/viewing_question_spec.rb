require 'spec_helper'

feature "Viewing Questions" do
  scenario "list all questions" do
    question = Factory.create(:question)
    visit '/'
    click_link question.title
    page.current_url.should == question_url(question)    
  end
end
