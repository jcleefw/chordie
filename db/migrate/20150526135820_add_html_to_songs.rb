class AddHtmlToSongs < ActiveRecord::Migration
  def change
    add_column :songs, :html, :string
  end
end
