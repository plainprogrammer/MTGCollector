class AddColumnsToCards < ActiveRecord::Migration[7.0]
  def change
    add_column :cards, :scryfall_small_image_uri, :string
    add_column :cards, :scryfall_large_image_uri, :string
    add_column :cards, :mana_cost, :string
    add_column :cards, :converted_mana_cost, :integer
    add_column :cards, :type_line, :string
  end
end
