class MTGJSON::Record < ActiveRecord::Base # standard:disable Rails/ApplicationRecord
  self.abstract_class = true
  self.inheritance_column = nil

  connects_to database: {reading: :mtgjson, writing: :mtgjson}

  def readonly?
    true
  end
end
