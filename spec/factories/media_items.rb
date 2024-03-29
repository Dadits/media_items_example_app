FactoryGirl.define do
  factory :media_item do
    user_id '1'
    sequence(:name) { |n| "Media Item ##{ n }" }
    media_type 'video'
    shared false
    link
  end
end