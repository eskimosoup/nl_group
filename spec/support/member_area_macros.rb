module MemberAreaMacros
  def login_to_member_area_with(email, password)
    visit member_area_login_path
    # use lower case so it looks for the for as contact us form in footer has email field
    fill_in "email", with: email
    fill_in "password", with: password
    click_button "Login"
    expect(current_path).to eq(member_area_member_profile_path)
  end

  def select_date(date, options = {})
    field = options[:from]
    select date.year.to_s,   from: "#{field}_1i" unless options[:discard_year] == true
    select Date::MONTHNAMES[date.month], from: "#{field}_2i" unless options[:discard_month] == true
    select date.day.to_s,    from: "#{field}_3i" unless options[:discard_day] == true
  end
end