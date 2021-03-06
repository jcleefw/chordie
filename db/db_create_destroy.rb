# Create Models


# rails g migration rename_access_type :access_levels, :type, :access_type
# rails g migration rename_users_access_level_to_access_level_id

# rails g migration add_password_digest_to_users password_digest:string
# rails g migration add_password_salt_to_users password_salt:string
# rails g migration add_speaker_id_to_talks speaker_id:int
# rails g migration add_image_url_to_speakers image_url:string

# rails g migration remove_talk_id_to_speaker
# rails migrate add_badge_to_talk badge:string

rails g model Song title:string artist:string data:text
rails g migration add_html_to_songs html:string
rails g migration rename_data_to_chordpro

# Destroy models
# rails destroy model Talk
# rails destroy model Speaker