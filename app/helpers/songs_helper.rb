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
      else
        trim = trim.split
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
      @title = directive[1]
      return generate_tag title, directive[1], "h1"
    when "subtitle", "st"
      title = "subtitle"
      @subtitle = directive[1]
      return generate_tag title, directive[1], "h3"
    when "album"
      @album = directive[1]
      return generate_tag directive[0], directive[1], "h5"
    when "artist"
      @artist = directive[1]
      return generate_tag directive[0], directive[1], "h5"
    when "comment", "c"
      return generate_comment_tag directive[1], "h2"
    when "key", "k"
      return generate_comment_tag directive[1], "h6"
    when "start_of_chorus", "soc"
      return generate_wrapper_tag "chorus", "div", "start"
    when "end_of_chorus", "eoc"
      return generate_wrapper_tag "chorus", "div", "end"
    when "start_of_header", "soh"
      return generate_wrapper_tag directive[0], "div", "start"
    when "end_of_header", "eoh"
      return generate_wrapper_tag directive[0], "div", "end"
    when "start_of_header", "sow"
      return generate_wrapper_tag directive[0], "div", "start"
    when "end_of_header", "eow"
      return generate_wrapper_tag directive[0], "div", "end"
    else
      puts "You gave me  -- I have no idea what to do with that."
    end

  end

  def generate_tag title, content, wrapper
    #binding.pry
    if title=="artist"
      "<#{wrapper} class='#{title}'>by #{content}</#{wrapper}>"
    else
      "<#{wrapper} class='#{title}'>#{content}</#{wrapper}>"
    end
  end

  def generate_comment_tag content, wrapper
    # create id for html
    id = content.split.join.downcase

    #create type for comment
    type = content.split[0].downcase

    "<#{wrapper} id='#{id}' class='comment #{type}'>#{content}</#{wrapper}>"

  end

  def generate_wrapper_tag type, wrapper, type_case
    #binding.pry
    if type_case == "start"
      "<#{wrapper} class='#{type}'>"
    elsif type_case == "end"
      "</#{wrapper}>"
    end
  end






end
