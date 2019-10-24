feature 'creating a listing' do
  scenario 'it creates a new listing' do

    sign_up
    visit "/user/profile"

    click_link 'Add property'
    add_listing
    expect(page).to have_content("Makers")
  end

  scenario 'when creating a new listing, the user can set availiablity' do
    sign_up
    visit "/user/profile"
    click_link 'Add property'
    fill_in 'name', with: 'Makers'
    fill_in 'description', with: '52 Commercial Place'
    fill_in 'price', with: 133
    fill_in 'start_date', with: "2019-10-22"
    fill_in 'end_date', with: "2019-12-25"
    click_button 'Submit'
    expect(page).to have_content("Tue 22nd Oct 2019")
    expect(page).to have_content("Wed 25th Dec 2019")
  end

  scenario 'creates two listings' do
    sign_up
    visit "/user/profile"
    click_link 'Add property'
    add_listing

    click_link 'Add property'
    fill_in 'name', with: 'Flat Iron'
    fill_in 'description', with: '60 Commercial Place'
    fill_in 'price', with: 166
    fill_in 'start_date', with: "2019-10-22"
    fill_in 'end_date', with: "2019-12-25"
    click_button 'Submit'

    expect(page).to have_content("Makers")
    expect(page).to have_content("Flat Iron")
  end
end
