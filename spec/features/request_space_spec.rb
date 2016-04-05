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
    add_space
    click_button 'request'
    click_button ''
  end

  scenario '> should be able to cancel and return to spaces page' do

  end
end
