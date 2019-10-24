feature 'Filter available listings by dates' do

  scenario 'when entering check-in dates, user can see available property' do
    create_new_property

    create_user2
    login_user2
    visit('/property/all')
    fill_in('check_in', with: "2020-01-05")
    fill_in('check_out', with: "2020-02-05")
    click_button('Submit')
    expect(page).to have_content("52 Commercial Place")

    # visit "/user/profile"
    # click_button 'Create'
    # fill_in 'name', with: 'Makers'
    # fill_in 'description', with: '52 Commercial Place'
    # fill_in 'price', with: 133
    # fill_in 'start_date', with: "2019-10-22"
    # fill_in 'end_date', with: "2019-12-25"
    # click_button 'Submit'
    # expect(page).to have_content("Available from: Tuesday 22nd October 2019")
    # expect(page).to have_content("Available to: Wednesday 25th December 2019")
  end

      # user1 signs up
    # list a property
    # create user2 login
    # visit all properties
    # fill the form chec it and checkout
    # expect to see the property

    # the same but with dates outside of the range
    # expect not to see the property

    # the same but with dates are withing the range
    # but there are some bookings
    # expect not to see the property

end
