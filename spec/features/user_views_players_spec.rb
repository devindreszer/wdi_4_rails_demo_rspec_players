require 'rails_helper'

feature 'User views players' do
  scenario 'on the front page' do

    # Setup
    Player.create!(name: 'Fred', job: 'Wizard', health: 50, magic: 150)
    Player.create!(name: 'Bart', job: 'Knight', health: 170, magic: 20)

    # Exercie
    visit root_path
    # 'visit' is a Capybara method! Avoid using it for only the root path
    # Equivalent to typing the path into the user's address bar

    # Verify
    within('tr', text: 'Fred') do
    # within block courtesy of Capybara
    # search a CSS selector and optionally some text
    # this is dependent on markup; not always the best thing
      expect(page).to have_content 'Wizard'
      expect(page).to have_content '50'
      expect(page).to have_content '150'
    end
    # page and have_content come from Capybara
    # page element is scoped to within block; if it's not in a block it scopes to the entire page
    # 'have_content' matcher looks at only the user-visible text on the page
    # and searches for the string we give it within that text
  end
end
