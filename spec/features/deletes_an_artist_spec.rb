require 'rails_helper'

describe "User goes to the artist page", :test => :feature do
  scenario "and clicks the delete button to remove the artist" do
    artist_name = "James Brown"
    image_path = "https://www.google.com/url?sa=i&rct=j&q=&esrc=s&source=images&cd=&ved=0ahUKEwj2q9vkrvTNAhVByGMKHWDjBDIQjRwIBw&url=https%3A%2F%2Frockhall.com%2Finductees%2Fjames-brown%2Fbio%2F&psig=AFQjCNHQlbpYF_gE8czMmzlk7deN6vicag&ust=1468634167927561"
    Artist.create(name: artist_name, image_path: image_path)

    visit artist_path(Artist.all.first)

    click_link "Delete"

    expect(current_path).to eql('/artists')

    within "#artists_list" do
      expect(page).not_to have_link(artist_name)
      expect(page).not_to have_link(image_path)
    end
  end
end
