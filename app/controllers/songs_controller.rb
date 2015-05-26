class SongsController < ApplicationController

  def show
    #binding.pry
  end

  def chp_html_conversion
    if !params["content"].nil?
      html = ""
      content = params["content"].split /\n/;
      chord_regex = /\[(([A-G]|[ABDEG](♭|b)|[AGCDF](♯|#)?)(maj|min|[Mm+°|])?6?(aug|d[io]m|ø)?7?(\/?((([A-G]|[ABDEG](♭|b)|[AGCDF](♯|#)?)(maj|min|[Mm+°|])?6?(aug|d[io]m|ø)?7?)?)))\]/;
      directives_regex = /\{.*?\}/
      content.map do |line|

        chords_found = line.scan(chord_regex)

        if chords_found

          chords = chords_found.map do |chord|

            line = line.gsub("[#{chord[0]}]", "<code class='chord' data-chordname='#{chord[0]}'>#{chord[0]}</code>")
          end
          html += "<p class='line'>#{line}</p>"

        end
      end

      render :json => html
    end
  end


end
