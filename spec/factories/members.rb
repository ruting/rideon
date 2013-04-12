# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :member do
    first_name "MyString"
    last_name "MyString"
    dob "2013-04-11"
    gender "MyString"
  end
end
