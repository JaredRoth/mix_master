class Artist::SongsController < ApplicationController
  def new
    @artist = Artist.find(params[:artist_id])
    @song = @artist.songs.new
  end

  def create
    @artist = Artist.find(params[:artist_id])
    @song = @artist.songs.new(song_params)
    if @song.save
      redirect_to song_path(@song)
    else
      render :new
    end
  end

  def index
    @artist = Artist.find(params[:artist_id])
    @songs = @artist.songs.all
  end

  def destroy
    song = Song.find(params[:id])
    song.destroy

    redirect_to artist_songs_path
  end

  private

  def song_params
    params.require(:song).permit(:title)
  end
end
