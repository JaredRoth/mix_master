require 'rails_helper'

RSpec.feature "User destroys a song" do
  context "when they have come from the artist page" do
    scenario 'they are redirected back to the artist and do not see the song' do
      artist = create(:artist)
      song = create(:song, artist_id: artist.id)

      visit artist_songs_path(artist)
      click_on "Delete"

      expect(current_path).to eq artist_songs_path(artist)
      expect(page).not_to have_link song.title, href: song_path(song)
    end
  end

  context 'when they have come from the songs index' do
    scenario 'they are redirected back to the songs index and do not see the song' do
      artist = create(:artist)
      song = create(:song, artist_id: artist.id)

      visit songs_path
      click_on "Delete"

      expect(current_path).to eq songs_path
      expect(page).not_to have_link song.title, href: song_path(song)
    end
  end
end
