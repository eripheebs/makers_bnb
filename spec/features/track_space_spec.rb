feature 'space belongs to a user' do
    scenario 'user can view their spaces' do
      add_space
      expect(current_path).to eq('/spaces')
    end

end
