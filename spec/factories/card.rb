FactoryGirl.define do
  factory :card do
    original "haus"
    translated "home"
    review  -3.days.from_now
  end
end
