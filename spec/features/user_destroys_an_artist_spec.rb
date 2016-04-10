require 'rails_helper'

RSpec.feature "User destroys an artist" do
  scenario 'they are redirected to the index and the artist is not there' do
    artist_name = "Michael Jackson"
    artist_image_path = "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg"
    Artist.create(name: artist_name, image_path: artist_image_path)
    visit artist_path(Artist.first)

    click_on "Delete"
    expect(page).to have_content "All Artists"
    expect(page).not_to have_content artist_name
    expect(page).not_to have_css("img[src=\"#{artist_image_path}\"]")
  end
end
