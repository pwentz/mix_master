require 'rails_helper'

describe "User creates a playlist", :type => :feature do

  scenario "they should see playlist title and song title links upon creation" do

    song_one, song_2, song_three = create_list(:song, 3)
    playlist_name = "My Jams"

    visit playlists_path
    click_link "Sign in with Spotify"
    click_link "New playlist"


    fill_in "playlist[name]", with: playlist_name
    check "song-#{song_one.id}"
    check "song-#{song_three.id}"
    click_button "Create Playlist"

    expect(page.find_by_id("playlist_name")).to have_content playlist_name

    within("li:first") do
      expect(page).to have_link song_one.title, href: artist_song_path(song_one.artist, song_one)
    end

    within("li:last") do
      expect(page).to have_link song_three.title, href: artist_song_path(song_three.artist, song_three)
    end
  end


  context "the submitted data is incomplete" do
    scenario "they see an error message" do
      visit new_playlist_path

      click_button "Create Playlist"

      expect(page.find("ul")).to have_content "Name can't be blank"
    end
  end
end
