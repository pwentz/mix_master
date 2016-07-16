require "rails_helper"

describe "User edits an existing artist's information", :type => :feature do
  scenario "they see the existing artist's information pre-filled" do
    artist_name = "James Brown"
    image_path = "https://www.google.com/url?sa=i&rct=j&q=&esrc=s&source=images&cd=&ved=0ahUKEwj2q9vkrvTNAhVByGMKHWDjBDIQjRwIBw&url=https%3A%2F%2Frockhall.com%2Finductees%2Fjames-brown%2Fbio%2F&psig=AFQjCNHQlbpYF_gE8czMmzlk7deN6vicag&ust=1468634167927561"
    Artist.create(name: artist_name, image_path: image_path)
    
    visit edit_artist_path(Artist.all.first)

    within(".edit_artist") do
      expect(page.find_field("Name").value).to eq(artist_name)
      expect(page.find_field("Image path").value).to eq(image_path)
    end
  end

  scenario "taken to page with updated information upon submission" do
    artist_name = "James Brown"
    image_path = "https://www.google.com/url?sa=i&rct=j&q=&esrc=s&source=images&cd=&ved=0ahUKEwj2q9vkrvTNAhVByGMKHWDjBDIQjRwIBw&url=https%3A%2F%2Frockhall.com%2Finductees%2Fjames-brown%2Fbio%2F&psig=AFQjCNHQlbpYF_gE8czMmzlk7deN6vicag&ust=1468634167927561"
    updated_artist_name = "Bob Marley"
    updated_image_path = "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg?partner=allrovi.com"
    Artist.create(name: artist_name, image_path: image_path)

    visit edit_artist_path(Artist.all.first)

    within(".edit_artist") do
      fill_in "artist[name]", with: updated_artist_name
      fill_in "artist[image_path]", with: updated_image_path
      click_button "Update Artist"
    end

    expect(current_path).to eq(artist_path(Artist.all.first))
    expect(page).to have_content(updated_artist_name)
    expect(page).not_to have_content(artist_name)

    expect(page.find("#artist_image")["src"]).to eq(updated_image_path)
    expect(page.find("#artist_image")["src"]).not_to eq(image_path)
  end
end
