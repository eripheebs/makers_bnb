feature 'owner edit function' do
  scenario 'space owner can amend details' do
    add_space
    click_button 'edit'
    fill_in :name, with: "chris's space"
    fill_in :description, with: "hell hole"
    fill_in :price, with: 20
    click_button 'submit'
    expect(page).not_to have_content "a lovely calming space"
    expect(page).to have_content "hell hole"
  end

end
