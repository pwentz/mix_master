#spec user_creates_an_artist_spec
require 'rails_helper'


describe "User submits a new artist", :type => :feature do
  scenario "they see the page for the individual artist" do
    artist_name = "Bob Marley"
    artist_image_path = "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg"

    visit artists_path
    click_on "New Artist"
    fill_in "artist_name", with: artist_name
    fill_in "artist_image_path", with: artist_image_path
    click_on "Create Artist"

    expect(page.find("#artist_name")).to have_content artist_name
    expect(page).to have_css("img[src=\"#{artist_image_path}\"]")
  end

  context "the submitted data is invalid" do
    scenario "they see an error message" do
      artist_image_path = "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg" 

      visit artists_path
      click_on "New Artist"
      fill_in "artist_image_path", with: artist_image_path
      click_on "Create Artist"

      expect(page.find("ul")).to have_content "Name can't be blank"
    end
  end
end
