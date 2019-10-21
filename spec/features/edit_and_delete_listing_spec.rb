feature 'user can update and delete exisitng listings' do
    scenario 'user can update a lisitng' do
        user = User.create(name: 'User', email: 'user@user.com', password: 'password')
        listing = Property.create(user_id: user.id, name: 'Makers', description: '52 Commercial Place', price_per_night: 133)

        visit "/user/#{user.id}"
        first('.listing').click_button 'Edit'

        fill_in 'name', with: 'Flat Iron'
        fill_in 'description', with: '60 Commercial Place'
        fill_in 'price', with: 166
        click_button 'Submit'

        expect(page).not_to have_content("Makers")
        expect(page).to have_content("Flat Iron")
    end

    scenario 'user can delete a lisitng' do
        user = User.create(name: 'User', email: 'user@user.com', password: 'password')
        listing = Property.create(user_id: user.id, name: 'Makers', description: '52 Commercial Place', price_per_night: 133)
        visit "/user/#{user.id}"
        first('.listing').click_button 'Delete'
        expect(page).not_to have_content("Makers")
    end
end
