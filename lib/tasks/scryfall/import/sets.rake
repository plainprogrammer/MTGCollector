require "uri"
require "net/http"
require "oj"

namespace :scryfall do
  namespace :import do
    desc "Import all current sets from Scryfall"
    task sets: :environment do
      uri = URI("https://api.scryfall.com/sets")
      raw_sets = Net::HTTP.get(uri)
      sets_to_import = []

      Oj::Doc.open(raw_sets) do |doc|
        doc.move("/data")
        doc.each_child do |child|
          set = child.fetch
          next if set["digital"]

          sets_to_import << {
            scryfall_id: set["id"],
            code: set["code"],
            name: set["name"],
            released_on: set["released_at"],
            set_type: set["set_type"],
            card_count: set["card_count"],
            icon_svg_uri: set["icon_svg_uri"]
          }
        end
      end

      puts "Sets to import: #{sets_to_import.size}"
      results = CardSet.upsert_all(sets_to_import, unique_by: :scryfall_id)
      puts "Imported or updated #{results.count} sets."
    end
  end
end
