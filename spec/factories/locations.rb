# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :location do
    route_id ""
    coordinate 1.5
    direction "MyString"
    time "2013-04-12 11:03:26"
  end
end
