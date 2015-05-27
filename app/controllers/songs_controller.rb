class SongsController < ApplicationController
  include SongsHelper
  include SongsUtils

  def index
    @songs = Song.all
  end

  def show

    @song = Song.find params["id"]
    @html = @song.html
  end

  def toggle_format
    binding.pry
    @song = Song.find params["id"]
  end

  def new
    render 'songs/conversion'
  end

  def save
    @song = Song.new(get_song_adding_params)
    @song.save

    if @song.save
      redirect_to songs_path
    else
      render 'show'
    end
  end

  def get_song_adding_params
    params.require(:song).permit(:html, :chordpro, :title, :artist)
  end


end
