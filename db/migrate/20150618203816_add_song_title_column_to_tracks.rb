class AddSongTitleColumnToTracks < ActiveRecord::Migration
  def change
    add_column :tracks, :track_title, :string
  end
end
