module MemberAreaMacros
  def login_to_member_area_with(email, password)
    visit member_area_login_path
    # use lower case so it looks for the for as contact us form in footer has email field
    fill_in "email", with: email
    fill_in "password", with: password
    click_button "Login"
    expect(current_path).to eq(member_area_member_profile_path)
  end
end