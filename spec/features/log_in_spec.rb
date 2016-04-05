feature 'Log in' do
  scenario 'should log in if correct details given' do
    sign_up_correctly
    log_in_correctly
    expect(current_path).to eq('/spaces')
  end
end
