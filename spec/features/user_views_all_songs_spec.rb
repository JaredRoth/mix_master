require 'rails_helper'

RSpec.feature "User visits the songs index" do
  scenario 'they see each songs title listed alphabetically with a link to its page' do
    song_five = create(:song, title: "Esther")
    song_four = create(:song, title: "Damien")
    song_two = create(:song, title: "Bobby")
    song_one = create(:song, title: "Abby")
    song_three = create(:song, title: "Charles")

    visit songs_path

    expect(page.find('ul li:nth-child(1)')).to have_link song_one.title, href: song_path(song_one)
    expect(page.find('ul li:nth-child(2)')).to have_link song_two.title, href: song_path(song_two)
    expect(page.find('ul li:nth-child(3)')).to have_link song_three.title, href: song_path(song_three)
    expect(page.find('ul li:nth-child(4)')).to have_link song_four.title, href: song_path(song_four)
    expect(page.find('ul li:nth-child(5)')).to have_link song_five.title, href: song_path(song_five)
  end
end
