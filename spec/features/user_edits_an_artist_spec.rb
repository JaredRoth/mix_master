require 'rails_helper'

RSpec.feature "User edits an artist" do
  scenario 'they see updated artist attributes' do
    artist_name = "Little Richard"
    artist_image_path = "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg"
    Artist.create(name: artist_name, image_path: artist_image_path)
    visit artists_path

    click_on artist_name
    click_on "Edit"
    fill_in "artist_name", with: "Jacob Malfoy"
    click_on "Update Artist"

    expect(page).to have_content "Jacob Malfoy"
    expect(page).not_to have_content artist_name
    expect(page).to have_css("img[src=\"#{artist_image_path}\"]")
  end
end
