class CreateAlbum < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.integer :band_id, null: false
      t.string :style_type, null: false
      t.string :title, null: false

      t.timestamps
    end

    add_index :albums, :band_id
    add_index :albums, :style_type
    add_index :albums, :title
  end
end
