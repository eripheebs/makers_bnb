feature 'request space' do
  scenario '> can click button to make request' do
    make_request
    expect(page.current_path).to eq('/request/new')
  end

  scenario '> should confirm which space you have requested' do
    make_request
    expect(page).to have_content "You are requesting chris's space"
  end

  scenario '> should be able to pick dates' do
    expect{request_space}.to change{Request.count}.by 1
    expect(page).to have_content "You have requested chris's space for dates: 2016-05-01 to 2016-05-02"
  end

  scenario '> should be able to cancel and return to spaces page' do
    make_request
    click_button 'Cancel'
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

  scenario '> should not be able to request your own space' do
    add_space
    click_button 'Request Space'
    expect(page).to have_content "You cannot request your own space!"
  end

  scenario '> end date must be after start date' do
    make_request
    fill_in :start_date, with: '2016/06/01'
    fill_in :end_date, with: '2016/05/02'
    click_button 'Submit'
    expect(page).to have_content "End date must be after start date"
  end

end
