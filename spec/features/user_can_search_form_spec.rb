require "rails_helper"

feature "as a user" do
  scenario "on the home page I can search form" do
    visit "/"

    fill_in "q", with: "sweet potatoes"

    click_on "Search"

    expect(current_path).to eq('/foods')
    expect(page).to have_content("531 for sweet potatoes")
  end
end

# As a user,
# When I visit "/"
# And I fill in the search form with "sweet potatoes"
# (Note: Use the existing search form)
# And I click "Search"
# Then I should be on page "/foods"
# Then I should see a total of the number of items
# returned by the search. (531 for sweet potatoes)
# Then I should see a list of ten foods sorted by relevance.
