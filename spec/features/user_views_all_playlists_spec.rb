require 'rails_helper'
#As a user
#Given that playlists exists in the database
#when I visit the playlists index,
#then I should see each playlist's name
#and each name should link to thta playlist's individual page

describe "User views all playlists", :test => :feature do
  scenario "they see links to all playlist's individual pages" do
    playlist_one, playlist_two = create_list(:playlist, 2)

    visit playlists_path

    within("ul") do
      expect(page).to have_link(playlist_one.name)
      expect(page).to have_link(playlist_two.name)
    end

    click_link playlist_two.name

    expect(current_path).to eq(playlist_path(playlist_two))
  end
end
