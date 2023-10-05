class CardSet < ApplicationRecord
  has_many :cards, inverse_of: :set
end
