class SongsController < ApplicationController
  include SongsHelper
  include SongsUtils

  def index
    @songs = Song.all
  end

  def show
    @song = Song.find params["id"]
    @html = @song.html
    nolyrics = chp_html_conversion({content:@song.chordpro, state:"hideLyrics"})
    @nolyrics = nolyrics.split(/\r/).join
  end

  def new
    render 'songs/conversion'
  end

  def edit
    @song = Song.find params["id"]
    render 'songs/conversion'
  end

  def save
    if params[:song][:id]
      song = Song.find params[:song][:id]
      song.chordpro = params[:song][:chordpro]
      song.html = params[:song][:html]
      song.save
      redirect_to songs_path
    else
      @song = Song.new(get_song_adding_params)
      @song.save

      if @song.save
        redirect_to songs_path
      else
        render 'show'
      end
    end
  end

  def get_song_adding_params
    params.require(:song).permit(:html, :chordpro, :title, :artist)
  end


end
