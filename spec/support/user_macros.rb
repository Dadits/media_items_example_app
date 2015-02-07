module UserMacros

  def login
    setup_account
    log_in
  end

  def logout
    visit destroy_user_session_path
  end
  
  def fill_in_signup_data
    @user_email = 'test@example.com'
    fill_in_user_data(@user_email, 'sign_up')
  end

  private
  
    def setup_account
      @user ||= create(:user, email: 'test@example.com', password: 'password123')
    end  

    def log_in
      fill_in_user_data(@user.email, 'sign_in')
      click_button 'Log in'
    end

    def fill_in_user_data(email, action)
      visit root_path
      click_link(action.humanize)
      within('#new_user') do
        fill_in 'Email', with: email
        fill_in 'Password', with: 'password123'
        fill_in('Password confirmation', with: 'password123') if %w(sign_up).include?(action)
      end
    end

end
