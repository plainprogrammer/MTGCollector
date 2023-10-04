require "rails_helper"

RSpec.describe CardSet, type: :model do
  it do
    is_expected.to have_many(:cards)
      .inverse_of(:set)
  end
end
