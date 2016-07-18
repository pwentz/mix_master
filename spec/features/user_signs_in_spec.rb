require 'rails_helper'

describe "User signs in with Spotify", :type => :feature do
  scenario "they see a link to sign out" do

    visit playlists_path
    click_link "Sign in with Spotify"
    login_div = page.find("#spotify_login")

    expect(login_div).to have_content("Sign out")
    expect(login_div).to have_content(User.first.name)
    expect(login_div).not_to have_content("Sign in with Spotify")
  end
end

