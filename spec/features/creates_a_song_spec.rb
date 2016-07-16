require 'rails_helper'

describe "user creates a new song", :type => :feature do
  scenario "they click the create song button, and are taken to the new page" do
    visit '/songs'

    click_link 'Create new song'

    expect(current_path).to eq("/songs/new")
    expect(page).to have_css("form")
  end

  scenario "they stay on page if title field is blank" do
    visit '/songs/new'

    click_button "Create Song"

    expect(current_path).to eq("/songs/new")
  end

  scenario "they are redirected to index after clicking submit" do
    visit '/songs/new'

    within("form") do
      fill_in "song[title]", with: "Killing Me Softly"
      click_button "Create Song"
    end

    expect(current_path).to eq("/songs")
  end

  scenario "they create a valid song and can see song title and link" do
    Song.create(title: "Killing Me Softly")

    visit '/songs'

    within("#songs_list") do
      expect(page).to have_link("Killing Me Softly")
    end
  end
end
