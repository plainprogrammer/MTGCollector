require "rails_helper"

RSpec.describe "Searching for cards" do
  it "works by card name" do
    visit cards_search_url

    expect(page).to have_selector("h1", text: "Search")

    fill_in "Search", with: "Sol Ring"
    click_button "Search"

    expect(page).to have_content("Sol Ring")
    expect(page).to have_content("Lost to time is the artificer's art of trapping light from a distant star in a ring of purest gold.")
  end
end
