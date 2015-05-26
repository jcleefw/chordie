class SongsController < ApplicationController
  include SongsHelper
  def show
    render 'songs/conversion'
  end

  def chp_html_conversion
    if !params["content"].nil?
      html = ""
      content = params["content"].split /\n/;
      chord_regex = /\[(([A-G]|[ABDEG](♭|b)|[AGCDF](♯|#)?)(maj|min|[Mm+°|])?6?(aug|d[io]m|ø)?7?(\/?((([A-G]|[ABDEG](♭|b)|[AGCDF](♯|#)?)(maj|min|[Mm+°|])?6?(aug|d[io]m|ø)?7?)?)))\]/;
      directives_regex = /\{.*?\}/
      content.map do |line|

        chords_found = line.scan(chord_regex)

        directives_found = line.scan(directives_regex)
        if chords_found.size > 0
          html += chords_to_html chords_found,line
        elsif directives_found.size>0
          html += directives_to_html directives_found
        else
          html += line
        end
      end

      render :json => html
    end
  end


end
