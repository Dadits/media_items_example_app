FactoryGirl.define do
  factory :image do
    file { File.new("#{ Rails.root }/spec/support/fixtures/uplift.jpg") }
  end
end