class SongsController < ApplicationController
  def show
    @song = Song.find(params[:id])
  end

  def edit
    @song = Song.find(params[:id])
  end

  def update
    @song = Song.find(params[:id])
    @song.update(song_params)

    redirect_to song_path(@song)
  end

  def index
    @songs = Song.all
  end

  def destroy
    song = Song.find(params[:id])
    song.destroy

    redirect_to songs_path
  end

  private

  def song_params
    params.require(:song).permit(:title)
  end
end
