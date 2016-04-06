feature 'space belongs to a user' do
    scenario 'user can view their spaces' do
      sign_up_correctly
      log_in_correctly
      click_button 'add_space'
      fill_in :name, with: "chris's space"
      fill_in :description, with: "a lovely calming space"
      fill_in :price, with: 20
      click_button 'submit'
      expect(current_path).to eq('/spaces')

    end

end
