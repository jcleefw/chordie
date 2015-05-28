# Chordie

Creating a online song database & platform to store and make readibilty easy.
Implementing Chordpro Song File Format into website to generate HTML

### File Format Reference
(ChordPro Markup Reference by UkeGeeks)[http://blog.ukegeeks.com/users-guide/chordpro-markup-reference/]
(ChordPro Song File Format Reference)[http://tenbyten.com/software/songsgen/help/HtmlHelp/files_reference.htm]

# Features Implemented
1. Chordpro -> HTML conversion
  - Validation to accept the followings
    - Basic Chords conversion
    - Extended Chords conversion
    - Dominant Chords conversion
    - Advance Extended Chord conversion
  - Directives conversion
    - title:, t:
    - subtitle:, st:
    - album:
    - artist:
    - comment: c:
  - Section wrapper conversion
    - start_of_chorus, soc
    - start_of_header, soh
    - start_of_wrapper, soq
  - Adding formatted songs into database
  - redirect to song list after saving
2. Show individual Song
  - style individual song show
  - create button state & change as it clicks
    - hide chords
    - hide lyrics
    - show both
3. Unit Testing
  - Unit testing for directive-html conversion

# work in progress
2. Show individual Song
  - option to hide lyrics
  - ajax call hide lyrics
3. Unit Testing
  - Unit testing for chords-html conversion



# Wishlist Features
Integration testing
Transpose song

References
