class SongsController < ApplicationController
  include SongsHelper
  def show
    render 'songs/conversion'
  end

  def chp_html_conversion
    if !params["content"].nil?
      html = ""


      chord_regex = /\[(([A-G]|[ABDEG](♭|b)|[AGCDF](♯|#)?)(maj|min|[Mm+°|])?6?(aug|d[io]m|ø)?7?(\/?((([A-G]|[ABDEG](♭|b)|[AGCDF](♯|#)?)(maj|min|[Mm+°|])?6?(aug|d[io]m|ø)?7?)?)))\]/;
      directives_regex = /\{.*?\}/
      section_regex = /(\{soc\}(.|\n)*\{eoc\})/

      content = params["content"].strip.split section_regex
      #content = params["content"].split /\n/;
      content = content.delete_if {|i| i == "\n" }
      content.map do |section|

        section = section.split /\n/;


        section.map do |line|
          #binding.pry
          if !line.empty?
            chords_found = line.scan(chord_regex)

            directives_found = line.scan(directives_regex)
            if chords_found.size > 0
              html += chords_to_html chords_found,line
            elsif directives_found.size>0
              html += directives_to_html directives_found
              #binding.pry
            else
              html += "<p>#{line}</p>"
            end
          end
        end #end of line map
      end # end of section map

      render :json => html
    end
  end

  def save
    if !params["chordpro"].nil?

    end
  end


end
