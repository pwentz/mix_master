require 'rails_helper'

describe "User visits the index page", :test => :feature do
  scenario "they see the existing artist's name and image path" do
   artist_name = "The Fugees"
   image_path = "http://static.tvtropes.org/pmwiki/pub/images/the-fugees_4802.jpg"
   create(:artist, :name => artist_name, :image_path => image_path)
   visit artists_path 


   within "#artists_list" do
     expect(page).to have_link(artist_name)
     expect(page).to have_link(image_path)
   end
  end
end
