module UserMacros

  def login
    setup_account
    log_in
  end

  def logout
    visit logout_path
  end

  private
  
    def setup_account
      @user ||= create(:user, email: 'test@example.com', password: 'password123')
    end  

    def log_in
      visit root_path
      click_on('sign_in_link')
      within('#signin-body') do
        fill_in 'email', with: @user.email
        fill_in 'password', with: 'password123'
      end
      click_button 'Log in'
    end

end
