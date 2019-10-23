feature 'view property page' do
    scenario 'user can view details of a single property' do
        property = create_new_property
        sign_up
        visit '/property/all'
        p Property.all.first
        expect(page).to have_content('Book')
        # expect(page).to have_button('book')
        click_link 'book'
        expect(page).to have_content('Makers')
        expect(path).to eq("/property/#{property.id}")
    end
end