require 'rails_helper'
describe 'sign up' do
  
  before do
    fill_in_signup_data
  end
  
  it 'lets user to sign up' do
    expect(User.count).to eq 0
    click_button 'Sign up'
    expect(User.count).to eq 1
    expect(User.find_by(email: @user_email).email).to eq @user_email
    expect(page).to have_content @user_email
  end
  
end