feature 'add spaces' do

  scenario 'I can add a name, description and price to my space' do
    visit '/new/space'
    fill_in :name, with: "chris's space"
    fill_in :description, with: "a lovely calming space"
    fill_in :price, with: "£20 per night"
    click_button('submit')
    expect(page).to have_content "chris's space"
    expect(page).to have_content "a lovely calming space"
    expect(page).to have_content "£20 per night"
  end

end
