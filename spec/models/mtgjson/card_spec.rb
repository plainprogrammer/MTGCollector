require "rails_helper"

RSpec.describe MTGJSON::Card do
  subject(:card) { MTGJSON::Card.order("RANDOM()").first }

  its(:id) { is_expected.to eq(card.uuid) }
  its(:readonly?) { is_expected.to be(true) }
end
