# frozen_string_literal: true

require_relative '../src/csv_parser'
require 'tempfile'

require 'pry'

RSpec.describe CSVParser do
  let(:csv_file) { Tempfile.new.tap { |f| f.write(csv_contents) }.tap(&:rewind) }
  let(:filepath) { csv_file.path }

  describe '.header_row' do
    subject { described_class.header_row(filepath) }

    # test would be something like:
    # expect CSV.parse(File.new(filepath).each_line.first).first to equal nil
    # how to fix it?
    # context 'when the csv file is missing headers' do
    #   let(:csv_contents) { ",,,\nfirstValue,secondValue" } 
    #   # binding.pry
    #   it "does not return nil" do
    #     expect(CSV.parse(("\ntext1").each_line.first).first).to eq nil
    #   # CSV.parse(File.new(filepath).each_line.first).first.map(&:downcase)
    #   end
    # end


    context 'when the csv file has data' do
      let(:csv_contents) { "firstHeader,secondHeader\nfirstValue,secondValue" }
      it { is_expected.to eq %w[firstheader secondheader] }
    end

    context 'when the csv file only has headers' do
      let(:csv_contents) { "firstHeader,secondHeader\n" }
      it { is_expected.to eq %w[firstheader secondheader] }
    end
  end
end
