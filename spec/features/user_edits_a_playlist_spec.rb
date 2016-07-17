require 'rails_helper'
#Given that a playlist and songs exist in the database
#when I visit that playlist's show page
#and I click on "Edit"
#and I enter a new playlist name
#and I select an additional song
#and I uncheck an existing song
#and I click on "Update playlist"
#then I should see the playlist's updated name
#and I should see the name of the newly added song
#and I should not see the name of the removed song

describe "User edits existing playlist", :test => :feature do
  scenario "they visit playlist page, see the added songs, don't see removed" do
    song_one, song_two, song_three = create_list(:song, 3)
    playlist = create(:playlist)
    playlist.songs << [song_one, song_three]

    visit playlist_path(playlist)
    click_link "Edit"

    fill_in "playlist[name]", with: playlist.name
    check "song-#{song_two.id}"
    uncheck "song-#{song_one.id}"
    uncheck "song-#{song_three.id}"
    click_button "Update Playlist"

    within("ul") do
      expect(page).not_to have_content song_one.title
      expect(page).not_to have_content song_three.title
    end

    within("li:first") do
      expect(page).to have_content song_two.title
    end
  end
end
