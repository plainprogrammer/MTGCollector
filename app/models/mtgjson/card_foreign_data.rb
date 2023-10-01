class MTGJSON::CardIdentifier < MTGJSON::Record
  self.primary_key = "uuid"
  self.table_name = "cardIdentifiers"
end
