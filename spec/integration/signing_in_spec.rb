require "spec_helper"

feature "User can sign in" do
  before do
    user = Factory(:user, email: "joe_user@app.com")
  end

  scenario 'via form' do
    visit '/'
    click_link 'Sign in'
    fill_in 'Email', with: 'joe_user@app.com'
    fill_in 'Password', with: 'password'
    click_button "Sign in"
    page.should have_content("Signed in successfully.")
  end

end
