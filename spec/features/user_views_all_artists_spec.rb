require 'rails_helper'

RSpec.feature "User visits the artists index" do
  scenario 'they see each artists name and link to its page' do
    artist_name = "Lionel Ritchie"
    artist_image_path = "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg"
    Artist.create(name: artist_name, image_path: artist_image_path)
    visit artists_path

    click_on artist_name

    expect(page).to have_content artist_name
  end
end
