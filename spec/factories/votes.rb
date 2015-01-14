FactoryGirl.define do
  factory :vote do
    id           1
    votable_id   1
    votable_type "question"
    direction    "up"
  end
end