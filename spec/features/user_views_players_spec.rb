require 'rails_helper'

feature 'User views players' do
  scenario 'with all attributes' do

    # Setup
    # FactoryGirl not needed because of the rails helper setup process
    players = create_list(:player, 3)

    # Exercie
    visit root_path
    # 'visit' is a Capybara method! Avoid using it for only the root path
    # Equivalent to typing the path into the user's address bar

    # Debugging Command!
    # will open current snapshot in web browser
    # save_and_open_page

    # Verify
    players.each do |player|
      within('tr', text: player.name) do
      # within block courtesy of Capybara
      # search a CSS selector and optionally some text
      # this is dependent on markup; not always the best thing
        expect(page).to have_content player.job
        expect(page).to have_content player.health
        expect(page).to have_content player.magic
      end
    end
    # page and have_content come from Capybara
    # page element is scoped to within block; if it's not in a block it scopes to the entire page
    # 'have_content' matcher looks at only the user-visible text on the page
    # and searches for the string we give it within that text
  end

  scenario 'in alphabetical order' do
    create(:player, name: 'George')
    create(:player, name: 'Zack')
    create(:player, name: 'Cecil')

    visit root_path

    # regular expression to check order
    # .* means any number of characters between
    # somewhere on page we should see Cecil than some number of characters
    # and then George
    expect(page).to have_content(/Cecil.*George.*Zack/)
  end
end
