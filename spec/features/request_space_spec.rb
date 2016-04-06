feature 'request space' do
  scenario '> can click button to make request' do
    sign_up_correctly
    add_space
    click_button 'request'
    expect(page.current_path).to eq('/request/new')
  end

  scenario '> should confirm which space you have requested' do
    sign_up_correctly
    add_space
    click_button 'request'
    expect(page).to have_content "You are requesting chris's space"
  end

  scenario '> should be able to pick dates' do
    expect{request_space}.to change{Request.count}.by 1
    expect(page).to have_content "You have requested chris's space for dates: 2016-05-01 to 2016-05-02"
  end

  scenario '> should be able to cancel and return to spaces page' do
    sign_up_correctly
    add_space
    click_button 'request'
    click_button 'cancel'
    expect(page.current_path).to eq('/spaces')
  end

  scenario '> shoud be able to view all requests' do
    request_space
    click_button 'view requests'
    expect(page.current_path).to eq('/requests_made')
    expect(page).to have_content "chris's space"
  end

  scenario '> should be able to cancel a request on viewing page' do
    request_space
    click_button 'view requests'
    expect{click_button 'cancel'}.to change{Request.count}.by -1
    expect(page.current_path).to eq('/requests_made')
  end

end
