require 'rails_helper'

describe "user sees all artists", :test => :feature do
  scenario "given article, user sees artist and information upon visiting index" do
   artist_name = "James Brown"
   image_path = "https://www.google.com/url?sa=i&rct=j&q=&esrc=s&source=images&cd=&ved=0ahUKEwj2q9vkrvTNAhVByGMKHWDjBDIQjRwIBw&url=https%3A%2F%2Frockhall.com%2Finductees%2Fjames-brown%2Fbio%2F&psig=AFQjCNHQlbpYF_gE8czMmzlk7deN6vicag&ust=1468634167927561"
   Artist.create(name: artist_name, image_path: image_path)
   visit artists_path 

   within "ul#artists_list" do
     expect("li#artists_name").to have_link(artist_name)
     expect("li#artists_image_path").to have_link(image_path)
   end
  end
end
