class CreateCards < ActiveRecord::Migration[7.0]
  def change
    create_table :cards do |t|
      t.uuid :scryfall_id, index: {unique: true}
      t.uuid :scryfall_set_id, index: true
      t.string :name
      t.integer :collector_number
      t.string :rarity
      t.string :scryfall_normal_image_uri

      t.timestamps
    end
  end
end
