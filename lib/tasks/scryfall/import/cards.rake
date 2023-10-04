require "uri"
require "net/http"
require "oj"

namespace :scryfall do
  namespace :import do
    desc "Import all cards from Scryfall"
    task cards: :environment do
      puts "Fetching bulk data source for all cards."
      bulk_data_uri = URI("https://api.scryfall.com/bulk-data")
      raw_bulk_data = Net::HTTP.get(bulk_data_uri)
      all_cards_uri = nil

      Oj::Doc.open(raw_bulk_data) do |doc|
        doc.move("/data")
        doc.each_child do |child|
          bulk_data = child.fetch
          next unless bulk_data["type"] == "all_cards"

          all_cards_uri = URI(bulk_data["download_uri"])
        end
      end

      puts "Downloading all card data."
      cards_to_import = []
      cards_count = 0
      batch_count = 0
      raw_all_cards = Net::HTTP.get(all_cards_uri)
      puts "Download complete!\n\n"

      Oj::Doc.open(raw_all_cards) do |doc|
        doc.each_child do |doc|
          card = doc.fetch
          next if card["digital"]

          cards_to_import << {
            scryfall_id: card["id"],
            scryfall_set_id: card["set_id"],
            name: card["name"],
            collector_number: card["collector_number"],
            rarity: card["rarity"]
          }

          if cards_to_import.size >= 1000
            cards_count += cards_to_import.size
            batch_count += 1
            Card.upsert_all(cards_to_import, unique_by: :scryfall_id)
            cards_to_import = []
            puts "Batch #{batch_count} imported/updated."
          end
        end

        cards_count += cards_to_import.size
        Card.upsert_all(cards_to_import, unique_by: :scryfall_id)
        puts "Imported or updated #{cards_count} cards."
      end
    end
  end
end
