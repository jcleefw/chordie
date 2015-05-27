class ChangeColumnHtmlToText < ActiveRecord::Migration
  def change
    change_column :songs, :html, :text
  end
end
