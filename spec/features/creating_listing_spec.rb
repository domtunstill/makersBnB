require 'web_helper'

feature 'creating a listing' do
  scenario 'it creates a new listing' do
    sign_up
    login
    user = User.where(name: 'User').first
    visit "/user/#{user.id}"
    click_button 'Create'
    add_listing
    expect(page).to have_content("Makers")
  end

  scenario 'when creating a new listing, the user can set availiablity' do
    sign_up
    login
    user = User.where(name: 'User').first
    visit "/user/#{user.id}"
    click_button 'Create'
    fill_in 'name', with: 'Makers'
    fill_in 'description', with: '52 Commercial Place'
    fill_in 'price', with: 133
    fill_in 'start_date', with: "2019-10-22"
    fill_in 'end_date', with: "2019-12-25"
    click_button 'Submit'
    expect(page).to have_content("Availiable from: Tuesday 22nd October 2019")
    expect(page).to have_content("Availiable to: Wednesday 25th December 2019")
  end

  scenario 'creates two listings' do
    sign_up
    login
    user = User.where(name: 'User').first
    visit "/user/#{user.id}"
    expect(current_path).to eq("/user/#{user.id}")
    click_button 'Create'
    expect(current_path).to eq("/user/#{user.id}/property/new")
    add_listing

    click_button 'Create'
    fill_in 'name', with: 'Flat Iron'
    fill_in 'description', with: '60 Commercial Place'
    fill_in 'price', with: 166
    click_button 'Submit'

    expect(page).to have_content("Makers")
    expect(page).to have_content("Flat Iron")
  end
end
