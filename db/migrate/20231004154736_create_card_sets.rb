class CreateCardSets < ActiveRecord::Migration[7.0]
  def change
    create_table :card_sets do |t|
      t.uuid :scryfall_id, index: {unique: true}
      t.string :code
      t.string :name
      t.date :released_on
      t.string :set_type
      t.integer :card_count
      t.string :icon_svg_uri

      t.timestamps
    end
  end
end
