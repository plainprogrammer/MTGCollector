require "digest"
require "open-uri"
require "zlib"

module MTGJSON
  module Fetch
    DATABASE_DOWNLOAD_PATH = Rails.root.join("tmp", "mtgjson.sqlite.gz").freeze
    CHECKSUM_DOWNLOAD_PATH = Rails.root.join("tmp", "mtgjson.sqlite.gz.sha256").freeze
    DATABASE_UNZIPPED_PATH = Rails.root.join("tmp", "mtgjson.sqlite").freeze

    def self.run
      download_database_archive
      download_database_checksum
      unzip_database if checksum_matches?
    end

    def self.checksum_matches?
      actual_checksum = Digest::SHA256.hexdigest File.binread(DATABASE_DOWNLOAD_PATH)
      expected_checksum = File.read(CHECKSUM_DOWNLOAD_PATH)

      actual_checksum == expected_checksum
    end
    private_class_method :checksum_matches?

    def self.download_database_checksum
      URI.open("https://mtgjson.com/api/v5/AllPrintings.sqlite.gz.sha256") do |download|
        File.binwrite(CHECKSUM_DOWNLOAD_PATH, download.read)
      end
    end
    private_class_method :download_database_checksum

    def self.download_database_archive
      URI.open("https://mtgjson.com/api/v5/AllPrintings.sqlite.gz") do |download|
        File.binwrite(DATABASE_DOWNLOAD_PATH, download.read)
      end
    end
    private_class_method :download_database_archive

    def self.unzip_database
      File.binwrite(DATABASE_UNZIPPED_PATH, Zlib.gunzip(File.binread(DATABASE_DOWNLOAD_PATH)))
    end
    private_class_method :unzip_database
  end
end
