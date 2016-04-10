feature 'owner edit function' do
  scenario 'space owner can amend details' do
    add_space
    visit('/user_spaces')
    click_button 'Edit'
    fill_in :name, with: "chris's space"
    fill_in :description, with: "hell hole"
    fill_in :price, with: 20
    fill_in :start_date, with: '2016/07/12'
    fill_in :end_date, with: '2016/07/20'
    click_button 'submit'
    expect(page).not_to have_content "a lovely calming space"
    expect(page).to have_content "hell hole"
  end

  scenario '< end date must be after start date' do
    add_space
    visit('/user_spaces')
    click_button 'Edit'
    fill_in :name, with: "chris's space"
    fill_in :description, with: "a space"
    fill_in :price, with: 20
    fill_in :start_date, with: '2016/07/12'
    fill_in :end_date, with: '2016/05/20'
    click_button 'submit'
    expect(page).to have_content "End date must be after start date"
  end

end
