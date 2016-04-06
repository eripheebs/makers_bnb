feature 'Log in' do
  scenario '> should log in if correct details given' do
    sign_up_correctly
    log_in_correctly
    expect(current_path).to eq('/spaces')
  end

  scenario '> should return personalised welcome message' do

  end

  scenario '> should not log in if password does not match' do
    sign_up_correctly
    log_in_incorrectly
    expect(page).to have_content 'Wrong Password'
    expect(current_path).not_to eq('/spaces')
  end

  scenario '> should not log in if user does not exist' do
    log_in_correctly
    expect(page).to have_content 'User does not exist!'
  end

  scenario '> should be able to log out from spaces' do
    sign_up_correctly
    click_button 'Log out'
    expect(current_path).to eq('/')
  end
end
