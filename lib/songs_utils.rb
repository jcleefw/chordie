module SongsUtils
  def chp_html_conversion
    if !params["content"].nil?
      html = ""
      # Regex to select valid chords. All unvalid chords will remain its original form
      chord_regex = /\[(([A-G]|[ABDEG](♭|b)|[AGCDF](♯|#)?)(maj|min|[Mm+°|])?6?(aug|d[io]m|ø)?7?(\/?((([A-G]|[ABDEG](♭|b)|[AGCDF](♯|#)?)(maj|min|[Mm+°|])?6?(aug|d[io]m|ø)?7?)?)))\]/;

      # Regex to select all directives eg: {title: X}
      directives_regex = /\{.*?\}/

      # Regex to select all section wrapper eg: {soc}
      section_regex = /(\{soc\}(.|\n)*\{eoc\})/

      # strip whitespace, and split to array according to section_regex
      content = params["content"].strip.split section_regex

      # Remove all unneccessary \n in array
      content = content.delete_if {|i| i == "\n" }

      # loop with map every array in section
      content.map do |section|

        # split section according to newline
        section = section.split /\n/;
        # Remove all unneccessary \n in array
        section = section.delete_if {|i| i == "\n" }

        # loop with map every line inside section
        section.map do |line|
          # if line is not empty
          if !line.empty?

            # split every chord that matches chord_regex
            chords_found = line.scan(chord_regex)
            # split every directive that matches directive_regex
            directives_found = line.scan(directives_regex)

            if chords_found.size > 0
              # convert chords into html
              html += chords_to_html chords_found,line
            elsif directives_found.size>0
              #convert directives into html
              html += directives_to_html directives_found
            else
              html += "<p>#{line}</p>"
            end
          end
        end #end of line map
      end # end of section map
      #binding.pry

      # render as json to return to ajax call
      render :json => {html: html, song_title: @title, song_artist: @artist}
    end
  end
end