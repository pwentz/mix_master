require 'rails_helper'

describe "User creates a playlist", :type => :feature do
  scenario "they should see playlist title and song title links upon creation" do
    song_1, song_2, song_3 = create_list(:song, 3)

    visit playlists_path
    click_link "New playlist"

    playlist_name = "My Jams"

    fill_in "playlist[name]", with: playlist_name
    check "song-#{song_1.id}"
    check "song-#{song_3.id}"
    click_button "Create Playlist"

    expect(page.find_by_id("playlist_name")).to have_content playlist_name

    within("li:first") do
      expect(page).to have_link song_1.title, href: song_path(song_1.id)
    end

    within("li:last") do
      expect(page).to have_link song_3.title, href: song_path(song_3.id)
    end
  end
end
