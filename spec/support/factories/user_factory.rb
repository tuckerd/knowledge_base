FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@app.com"}
    password "password"
    password_confirmation "password"
  end
end
