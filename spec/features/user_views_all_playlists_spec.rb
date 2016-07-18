require 'rails_helper'
#As a user
#Given that playlists exists in the database
#when I visit the playlists index,
#then I should see each playlist's name
#and each name should link to thta playlist's individual page

describe "User views all playlists", :test => :feature do
  context "while signed-in" do
    it "shows you your playlists on the home page" do
      visit playlists_path
      click_link "Sign in with Spotify"
      user = User.first
      playlist = create(:playlist)
      user.playlists << playlist

      visit playlists_path

      expect(page.find("ul")).to have_link(playlist.name)
    end
  end

  context "while not signed-in" do
    it "shows you your playlists on the home page" do
    end
  end
end
