feature 'Control requests to your spaces' do
  scenario '> user should be able to view all requests made to their spaces' do
    request_space
    visit ('/spaces')
    click_button 'Log out'
    log_in_correctly
    visit ('/user_spaces')
    expect(page).to have_content "Your space has been requested by dweeb from 2016-05-01 to 2016-05-02"
  end
end
