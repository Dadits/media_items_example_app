require 'rails_helper'

describe 'sign in' do

  before do
    login
  end

  it 'let\'s user in' do
    expect(page).to have_content @user.email
  end

end