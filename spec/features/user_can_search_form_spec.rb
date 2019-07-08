require "rails_helper"

feature "as a user" do
  scenario "on the home page I can search form" do
    visit "/"

    fill_in "q", with: "sweet potatoes"

    click_on "Search"

    expect(current_path).to eq('/foods')

    expect(page).to have_content("531 for sweet potatoes")
    within("#results-1") do
      expect(page).to have_content("Branded Food Products Database")
      expect(page).to have_content("AHOLD, SIMPLY ENJOY, GOURMET DIP WITH PEPPER TOPPING, SWEET POTATO HARISSA")
      expect(page).to have_content("45046964")
      expect(page).to have_content("LI")
      expect(page).to have_content("Ahold USA, Inc.")
    end
    within("#results-10") do
      expect(page).to have_content("Baby Foods")
      expect(page).to have_content("Babyfood, corn and sweet potatoes, strained")
      expect(page).to have_content("3934")
      expect(page).to have_content("SR")
      expect(page).to have_content("none")
    end
    within("#results-11") do
      expect(page).to_not have_content("name")
    end
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

# And for each of the foods I should see:
# - The food's NDB Number
# - The food's name
# - The food group to which the food belongs
# - The food's data source
# - The food's manufacturer
