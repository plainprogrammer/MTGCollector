require "digest"
require "open-uri"
require "zlib"

module MTGJSON
  module Fetch
    DATABASE_DOWNLOAD_PATH = Rails.root.join("tmp", "mtgjson.sqlite.gz").freeze
    CHECKSUM_DOWNLOAD_PATH = Rails.root.join("tmp", "mtgjson.sqlite.gz.sha256").freeze
    DATABASE_UNZIPPED_PATH = Rails.root.join("tmp", "mtgjson.sqlite").freeze

    def self.run
      URI.open("https://mtgjson.com/api/v5/AllPrintings.sqlite.gz") do |download|
        File.binwrite(DATABASE_DOWNLOAD_PATH, download.read)
      end

      URI.open("https://mtgjson.com/api/v5/AllPrintings.sqlite.gz.sha256") do |download|
        File.binwrite(CHECKSUM_DOWNLOAD_PATH, download.read)
      end

      actual_checksum = Digest::SHA256.hexdigest File.binread(DATABASE_DOWNLOAD_PATH)
      expected_checksum = File.read(CHECKSUM_DOWNLOAD_PATH)

      if actual_checksum == expected_checksum
        File.binwrite(DATABASE_UNZIPPED_PATH, Zlib.gunzip(File.binread(DATABASE_DOWNLOAD_PATH)))
      end
    end
  end
end
