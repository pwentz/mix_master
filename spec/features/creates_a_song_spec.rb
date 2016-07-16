require 'rails_helper'

describe "user creates a new song", :type => :feature do
  scenario "they click the create song button, and are taken to the new page" do
    artist = Artist.create(name: "The Fugees", image_path: "http://static.tvtropes.org/pmwiki/pub/images/the-fugees_4802.jpg" )
    visit artist_path(artist.id)

    click_link 'New song'

    expect(current_path).to eq(new_artist_song_path(artist.id))
    expect(page).to have_css("form")
  end

  scenario "they stay on page if title field is blank" do
    artist = Artist.create(name: "The Fugees", image_path: "http://static.tvtropes.org/pmwiki/pub/images/the-fugees_4802.jpg" )
    visit new_artist_song_path(artist.id)

    click_button "Create Song"

    expect(current_path).to eq(new_artist_song_path(artist.id))
  end

  scenario "they are redirected to index after clicking submit" do
    artist = Artist.create(name: "The Fugees", image_path: "http://static.tvtropes.org/pmwiki/pub/images/the-fugees_4802.jpg" )
    visit new_artist_song_path(artist.id)

    within("form") do
      fill_in "song[title]", with: "Killing Me Softly"
      click_button "Create Song"
    end

    expect(current_path).to eq(artist_path(artist.id))
  end

  scenario "they create a valid song and can see song title and link" do
    artist = Artist.create(name: "The Fugees", image_path: "http://static.tvtropes.org/pmwiki/pub/images/the-fugees_4802.jpg" )
    artist.songs.create(title: "Killing Me Softly")

    visit artist_path(artist.id)

    within("#songs_list") do
      expect(page).to have_link("Killing Me Softly")
    end
  end
end
