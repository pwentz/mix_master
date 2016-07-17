require 'rails_helper'

describe "user creates a new song", :type => :feature do
  scenario "they click the create song button, and are taken to the new page" do
    artist = create(:artist)
    visit artist_path(artist.id)

    click_link 'New song'

    expect(current_path).to eq(new_artist_song_path(artist.id))
    expect(page).to have_css("form")
    expect(page.find(".new_song")).not_to have_content("Title can't be blank")
    expect(page.find(".new_song")).not_to have_content("Title is too short (minimum is zero characters)")
  end

  scenario "they stay on page if title field is blank" do
    artist = create(:artist)
    visit new_artist_song_path(artist.id)

    click_button "Create Song"

    expect(page.find("ul")).to have_content("Title can't be blank")
  end

  scenario "they are redirected to index after clicking submit" do
    artist = create(:artist)
    visit new_artist_song_path(artist.id)

    within("form") do
      fill_in "song[title]", with: "Killing Me Softly"
      click_button "Create Song"
    end

    expect(current_path).to eq(artist_path(artist.id))
  end

  scenario "they create a valid song and can see song title and link" do
    artist = create(:artist)
    song = create(:song, :title => "Killing Me Softly", :artist => artist)

    visit artist_path(artist.id)

    within("#songs_list") do
      expect(page).to have_link artist.songs.first.title
    end
  end
end
