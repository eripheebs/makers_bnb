feature 'date range' do
  it 'denies a booking request for a date not in range' do
    expect{request_space_out_of_range}.not_to change{Request.count}
    expect(page).to have_content "chris's space is not available for those dates!"
  end
end
