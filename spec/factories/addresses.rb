# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :address do
    location ""
    gmaps false
    street "MyString"
    city "MyString"
    zipcode "MyString"
    country "MyString"
  end
end
