require "rails_helper"

RSpec.describe CardSet, type: :model do
  it { is_expected.to have_db_column(:scryfall_id) }
  it { is_expected.to have_db_column(:name) }
  it { is_expected.to have_db_column(:released_on) }
  it { is_expected.to have_db_column(:set_type) }
  it { is_expected.to have_db_column(:card_count) }
  it { is_expected.to have_db_column(:icon_svg_uri) }

  it do
    is_expected.to have_many(:cards)
      .inverse_of(:set)
  end
end
