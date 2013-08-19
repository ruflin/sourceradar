# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :vulnerability do
    file "MyFile"
    loc 1
    who_commited_it? "MyString"
    points 1
    description "MyString"
  end
end
