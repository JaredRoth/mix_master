require 'rails_helper'

RSpec.feature "User edits a song" do
  scenario 'they see link to artist and an updated song title' do
    song = create(:song)
    visit song_path(song)

    click_on "Edit"
    fill_in "song_title", with: "New Title"
    click_on "Update Song"

    expect(page).to have_content "New Title"
    expect(page).to have_link song.artist.name, href: artist_path(song.artist)
  end
end
