feature 'testing capybara' do
  scenario 'capybara works' do
    visit '/'
    expect(page).to have_content 'hello world'
  end
end
