module SongsHelper
  def chords_to_html chords_found,line
    html=""
    chords = chords_found.map do |chord|
      # replace [chords] with html codes
      line = line.gsub("[#{chord[0]}]", "<code class='chord' data-chordname='#{chord[0]}'>#{chord[0]}</code>")
    end
    # add <p> tag around each line
    html += "<p class='line'>#{line}</p>"
  end

  def directives_to_html directives_found
    #binding.pry
    html=""
    directives_regex = /[{}]/
    directives_found.each do |directive|
      # replace {} for directive
      trim = directive.gsub(directives_regex, "");

      if trim.include? ':'
        # strip of any whitespace from string after split
        trim = trim.split(':').collect(&:strip);
      end
      html += directive_switch trim
    end
    html
    #binding.pry
  end

  def directive_switch directive
    # according to what directive is parse in generate html
    case directive[0]
    when "title", "t"
      title = "title"
      return generate_tag title, directive[1], "h1"
    when "subtitle", "st"
      title = "subtitle"
      return generate_tag title, directive[1], "h3"
    when "album"
      return generate_tag directive[0], directive[1], "h5"
    when "artist"
      return generate_tag directive[0], directive[1], "h5"
    when "comment", "c"
      return generate_comment_tag directive[1], "h2"
    when "key", "k"
      return generate_comment_tag directive[1], "h6"
    else
      puts "You gave me  -- I have no idea what to do with that."
    end

  end

  def generate_tag title, content, wrapper
    #binding.pry
    "<#{wrapper} class='#{title}'>#{content}</#{wrapper}>"
  end

  def generate_comment_tag content, wrapper
    # create id for html
    id = content.split.join.downcase

    #create type for comment
    type = content.split[0].downcase
    #binding.pry
    "<#{wrapper} id='#{id}' class='comment #{type}'>#{content}</#{wrapper}>"
  end
end
