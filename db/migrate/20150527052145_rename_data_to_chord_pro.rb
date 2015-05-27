class RenameDataToChordPro < ActiveRecord::Migration
  def change
    rename_column :songs, :data, :chordpro
  end
end
