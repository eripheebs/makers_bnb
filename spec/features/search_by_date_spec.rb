feature 'search by date' do

  scenario '< can filter spaces by available dates' do
    add_two_spaces
    fill_in :start_date, with: "2016/05/24"
    fill_in :end_date, with: "2016/06/30"
    click_button 'Search'
    expect(page).to have_content "nick's space"
    expect(page).not_to have_content "chris's space"
  end

  scenario '< will not return a space which is booked for filtered dates' do
    filter_spaces_after_booking
    fill_in :start_date, with: "2016/04/24"
    fill_in :end_date, with: "2016/05/15"
    click_button 'Search'
    expect(page).to have_content "nick's space"
    expect(page).not_to have_content "chris's space"
  end
end
