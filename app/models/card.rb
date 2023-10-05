class Card < ApplicationRecord
  belongs_to :set,
    class_name: "CardSet",
    primary_key: :scryfall_id,
    foreign_key: :scryfall_set_id,
    optional: false
end
