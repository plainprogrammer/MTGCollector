require "rails_helper"

RSpec.describe Card, type: :model do
  it { is_expected.to have_db_column(:scryfall_id) }
  it { is_expected.to have_db_column(:scryfall_set_id) }
  it { is_expected.to have_db_column(:name) }
  it { is_expected.to have_db_column(:collector_number) }
  it { is_expected.to have_db_column(:rarity) }
  it { is_expected.to have_db_column(:mana_cost) }
  it { is_expected.to have_db_column(:converted_mana_cost) }
  it { is_expected.to have_db_column(:type_line) }
  it { is_expected.to have_db_column(:scryfall_small_image_uri) }
  it { is_expected.to have_db_column(:scryfall_normal_image_uri) }
  it { is_expected.to have_db_column(:scryfall_large_image_uri) }

  it do
    is_expected.to belong_to(:set)
      .class_name("CardSet")
      .with_foreign_key("scryfall_set_id")
      .with_primary_key("scryfall_id")
      .required
  end
end
