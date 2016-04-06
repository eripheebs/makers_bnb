feature 'Control requests to your spaces' do
  scenario '> user should be able to view all requests made to their spaces' do
    request_space
    visit ('/spaces')
    click_button 'Log out'
    log_in_correctly
    visit ('/user_spaces')
    expect(page).to have_content "Your space has been requested by dweeb from 2016-05-01 to 2016-05-02"
  end

  scenario '> user should be able to reject the request' do
    request_space
    visit ('/spaces')
    click_button 'Log out'
    log_in_correctly
    visit ('/user_spaces')
    expect{click_button 'reject'}.to change{Request.count}.by -1
  end

  scenario '> user should be able to accept the request' do
    request_space
    visit ('/spaces')
    click_button 'Log out'
    log_in_correctly
    visit ('/user_spaces')
    expect{click_button 'accept'}.to change{Booking.count}.by 1
    expect(page).to have_content "chris's space"
  end
end
