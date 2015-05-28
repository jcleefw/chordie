require 'rails_helper'

RSpec.describe SongsHelper, type: :helper do

  directive_variable = ["title", "t", "subtitle", "st", "artist", "a", "key", "k"]
  comment_tag_variable = ["comment", "c"]
  wrapper_tag_variable = ["soc", "eoc", "soh", "eoh", "sow", "eow"]
  #directive = directive_variable.sample

  ## Test remove_chp_directive_wrapper(chp_content)
  it "should remove {} from {random_directives: }" do
    directive = directive_variable.sample
    content = "{#{directive}: Hello World}"
    expect(remove_chp_directive_wrapper content).to eq "#{directive}: Hello World"
  end

  it "should accept {{random_directives}} and does not affect" do
    directive = directive_variable.sample
    content = "{#{directive}: Hello World}}"
    expect(remove_chp_directive_wrapper content).to eq "#{directive}: Hello World"
  end

  #-----------------------------------------------------------
  ## Test directive_switch(directive)
  it "make sure title directive not empty when returns" do
    expect(directive_switch ["title", "Hello World"]).to eq "<h1 class='title'>Hello World</h1>"
  end

  it "make sure wrapper_tag does not return empty" do
    expect(directive_switch([wrapper_tag_variable.sample])).not_to eq "You gave something that I have no idea what to do with that."
  end

  it "If directive is not directives specified" do
    expect(directive_switch(["maker"])).to eq "You gave something that I have no idea what to do with that."
  end

  it "if argument passed is not array, else message" do
    expect(directive_switch("maker")).to eq "You gave something that I have no idea what to do with that."
  end

  it "should get html for comment_tag variable" do
    expect(directive_switch ["comment","Verse 1"]).to eq "<h2 id='verse1' class='comment verse'>Verse 1</h2>"
  end

  it "should get html for start wrapper_tag variable" do
    expect(directive_switch ["soh"]).to eq "<div class='soh'>"
  end

  it "should get html for end wrapper_tag variable" do
    expect(directive_switch ["eow"]).to eq "</div>"
  end

  #-----------------------------------------------------------

  ## Test generate_tag(title, content, wrapper)
  it "should convert directive variable eg. {title}" do
    directive = directive_variable.sample
    result = generate_tag directive,"Hello World","h1"
    expect(result).to eq "<h1 class='#{directive}'>Hello World</h1>"
  end

  #-----------------------------------------------------------

  ## Test generate_comment_tag(content, wrapper)
  it "should convert comment_tag variable eg. {title}" do
    result = generate_comment_tag "Verse 1","h4"
    expect(result).to eq "<h4 id='verse1' class='comment verse'>Verse 1</h4>"
  end

  #-----------------------------------------------------------

  ## Test generate_wrapper_tag type, wrapper, type_case
  it "should convert start wrapper_tag variable eg. {soc}" do
    result = generate_wrapper_tag "start-of-chorus","div", "start"
    expect(result).to eq "<div class='start-of-chorus'>"
  end

  it "should convert end wrapper_tag variable eg. {soc}" do
    result = generate_wrapper_tag "eoc","div", "end"
    expect(result).to eq "</div>"
  end

  it "should be nil if wrong type case is passed" do
    result = generate_wrapper_tag "soc","div", "efr"
    expect(result).to eq nil
  end


end
