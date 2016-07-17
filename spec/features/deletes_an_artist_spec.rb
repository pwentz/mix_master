require 'rails_helper'

describe "User goes to the artist page", :test => :feature do
  scenario "and clicks the delete button to remove the artist" do
    artist_name = "The Fugees"
    image_path = "http://static.tvtropes.org/pmwiki/pub/images/the-fugees_4802.jpg"
    artist = create(:artist)

    visit artist_path(artist)

    click_link "Delete"

    expect(current_path).to eql('/artists')

    within "#artists_list" do
      expect(page).not_to have_link(artist_name)
      expect(page).not_to have_link(image_path)
    end
  end
end
