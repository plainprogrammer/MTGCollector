require "mtgjson/fetch"

namespace :mtgjson do
  desc "Fetch MTGJSON database"
  task fetch: :environment do
    MTGJSON::Fetch.run
  end
end
