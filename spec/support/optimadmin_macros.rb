module OptimadminMacros
  def login_with(username, password)
    visit optimadmin.login_path
    expect(current_path).to eq(optimadmin.login_path)
    fill_in "Email or Username", with: username
    fill_in "Password", with: password
    click_button "Log In"
    expect(current_path).to eq(optimadmin.root_path)
    expect(page).to have_content("Logged in!")
  end
end