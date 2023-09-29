require "rails_helper"
require "mtgjson/fetch"

RSpec.describe MTGJSON::Fetch, ".run" do
  let(:download_path) { MTGJSON::Fetch::DATABASE_DOWNLOAD_PATH }
  let(:checksum_path) { MTGJSON::Fetch::CHECKSUM_DOWNLOAD_PATH }
  let(:database_path) { Rails.root.join("tmp", "mtgjson.sqlite") }

  before do
    File.delete download_path if File.exist? download_path
    File.delete checksum_path if File.exist? checksum_path
    File.delete database_path if File.exist? database_path
  end

  after do
    File.delete download_path if File.exist? download_path
    File.delete checksum_path if File.exist? checksum_path
    File.delete database_path if File.exist? database_path
  end

  it "downloads the compressed SQLite database" do
    expect {
      described_class.run
    }.to change {
      File.exist? download_path
    }.from(false).to(true)
  end

  it "downloads the SHA256 checksum for the database" do
    expect {
      described_class.run
    }.to change {
      File.exist? checksum_path
    }.from(false).to(true)
  end

  it "decompresses the database if the checksum passes" do
    expect {
      described_class.run
    }.to change {
      File.exist? database_path
    }.from(false).to(true)
  end
end
