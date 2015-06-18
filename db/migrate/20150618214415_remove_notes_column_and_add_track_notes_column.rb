class RemoveNotesColumnAndAddTrackNotesColumn < ActiveRecord::Migration
  def change
    remove_column :notes, :notes
    add_column :notes, :track_notes, :text
  end
end
