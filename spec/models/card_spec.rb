require "rails_helper"

RSpec.describe Card, type: :model do
  it do
    is_expected.to belong_to(:set)
      .class_name("CardSet")
      .with_foreign_key("scryfall_set_id")
      .with_primary_key("scryfall_id")
      .required
  end
end
