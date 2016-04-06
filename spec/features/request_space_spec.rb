feature 'request space' do
  scenario '> can click button to make request' do
    add_space
    click_button 'request'
    expect(page.current_path).to eq('/request/new')
  end

  scenario '> should confirm which space you have requested' do
    add_space
    click_button 'request'
    expect(page).to have_content "You are requesting chris's space"
  end

  scenario '> should be able to pick dates' do
    sign_up_correctly
    add_space
    click_button 'request'
    fill_in :start_date, with: '2016/05/01'
    fill_in :end_date, with: '2016/05/02'
    expect{click_button 'Submit'}.to change{Request.count}.by 1
    expect(page).to have_content "You have requested chris's space for dates: 2016-05-01 to 2016-05-02"
  end

  scenario '> should be able to cancel and return to spaces page' do
    sign_up_correctly
    add_space
    click_button 'request'
    click_button 'cancel'
    expect(page.current_path).to eq('/spaces')
  end
end
