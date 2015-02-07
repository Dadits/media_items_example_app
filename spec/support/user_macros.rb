module UserMacros

  def login
    setup_account
    log_in
  end

  def logout
    visit destroy_user_session_path
  end

  private
  
    def setup_account
      @user ||= create(:user, email: 'test@example.com', password: 'password123')
    end  

    def log_in
      visit root_path
      click_link('Sign in')
      within('#new_user') do
        fill_in 'Email', with: @user.email
        fill_in 'Password', with: 'password123'
      end
      click_button 'Log in'
    end

end
