feature 'add spaces' do

  scenario 'I can add a name, description and price to my space' do
    add_space
    expect(page).to have_content "chris's space"
    expect(page).to have_content "a lovely calming space"
    expect(page).to have_content 20
  end

end
