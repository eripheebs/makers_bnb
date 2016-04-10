feature 'add spaces' do

  scenario '< create a space witn name, description and price' do
    add_space
    expect(page).to have_content "chris's space"
    expect(page).to have_content "a lovely calming space"
    expect(page).to have_content 20
  end

  scenario '< end date must be after start date' do
    sign_up_correctly
    click_link "add_space"
    fill_in :name, with: "chris's space"
    fill_in :description, with: "a lovely calming space"
    fill_in :price, with: 20
    fill_in :start_date, with: '2016/06/10'
    fill_in :end_date, with: '2016/05/15'
    click_button('submit')
    expect(page).to have_content "End date must be after start date"
  end

end
