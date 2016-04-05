feature 'Log in' do
  scenario 'should log in if correct details given' do
    sign_up_correctly
    log_in_correctly
    expect(page.current_url).to eq('/spaces')
  end
end
