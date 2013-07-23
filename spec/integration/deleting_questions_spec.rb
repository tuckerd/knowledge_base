require "spec_helper"

feature "Deleting Questions" do
  scenario "deleting a question" do
    Factory(:question, title: "How do you tie your shoe?")
    user = Factory(:user)
    visit '/'
    sign_in_as!(user)
    click_link "How do you tie your shoe?"
    click_link "Delete Question"
    page.should have_content("Question has been deleted.")

    visit '/'
    page.should_not have_content("How do you tie your shoe?")
  end
end
