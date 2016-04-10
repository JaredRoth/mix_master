require 'rails_helper'

RSpec.feature "User visits an artists songs index" do
  scenario 'they see all the artists songs sorted alphabetically with their links' do
    artist = create(:artist)
    song_five = create(:song, title: "Esther", artist_id: artist.id)
    song_four = create(:song, title: "Damien", artist_id: artist.id)
    song_two = create(:song, title: "Bobby", artist_id: artist.id)
    song_one = create(:song, title: "Abby", artist_id: artist.id)
    song_three = create(:song, title: "Charles", artist_id: artist.id)

    visit artist_path(artist)
    click_on "View Songs"

    expect(page.find('ul li:nth-child(1)')).to have_link song_one.title, href: song_path(song_one)
    expect(page.find('ul li:nth-child(2)')).to have_link song_two.title, href: song_path(song_two)
    expect(page.find('ul li:nth-child(3)')).to have_link song_three.title, href: song_path(song_three)
    expect(page.find('ul li:nth-child(4)')).to have_link song_four.title, href: song_path(song_four)
    expect(page.find('ul li:nth-child(5)')).to have_link song_five.title, href: song_path(song_five)
  end
end
