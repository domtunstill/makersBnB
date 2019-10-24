feature 'view property page' do
    scenario 'user can view details of a single property' do
        property = create_new_property
        sign_up
        visit '/property/all'
        click_link 'Makers'
        expect(page).to have_content('Makers')
        expect(current_path).to eq("/property/#{property.id}")
    end
end