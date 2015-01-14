FactoryGirl.define do
  factory :vote do
    votable_id 1
    votable_type "question"
    direction "up"
  end
end