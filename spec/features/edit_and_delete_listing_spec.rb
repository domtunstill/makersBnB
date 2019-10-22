require 'web_helper'

feature 'user can update and delete exisitng listings' do
    scenario 'user can update a lisitng' do
        sign_up
        login
        user = User.where(name: 'User').first
        visit "/user/#{user.id}"
        click_button 'Create'
        add_listing
        first('.listing').click_button 'Edit'
        fill_in 'name', with: 'Flat Iron'
        fill_in 'description', with: '60 Commercial Place'
        fill_in 'price', with: 166
        click_button 'Submit'
        expect(page).not_to have_content("Makers")
        expect(page).to have_content("Flat Iron")
    end

    scenario 'user can delete a lisitng' do
        sign_up
        login
        user = User.where(name: 'User').first
        visit "/user/#{user.id}"
        click_button 'Create'
        add_listing
        first('.listing').click_button 'Delete'
        expect(page).not_to have_content("Makers")
    end
end
