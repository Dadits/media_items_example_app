require 'rails_helper'
describe 'sign in' do

  before do
    login
  end

  it 'lets user in' do
    expect(page).to have_content @user.email
    expect(page).to have_content 'Manage Media Items'
    expect(page).to have_content 'Logout'
  end
  
  it 'lets user out' do
    logout
    expect(page).to have_content 'Sign in'
  end
  

end