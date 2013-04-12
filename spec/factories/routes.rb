# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :route do
    type ""
    price ""
    min 1
    max 1
    date "2013-04-12"
    time "2013-04-12 01:17:24"
    allowed 1
    provider_id 1
  end
end
