require 'rails_helper'

RSpec.describe Shortener, type: :model do
  describe '#find' do
    before do
      described_class.paths['12345678'] = 'http://www.farmdrop.com'
      described_class.paths['abcdefgh'] = 'http://www.google.com'
    end

    after { described_class.paths.clear }

    it 'should return the requested value, or nil' do
      expect(described_class.find('12345678')).to eq('http://www.farmdrop.com')
      expect(described_class.find('abcdefgh')).to eq('http://www.google.com')
      expect(described_class.find('1234abcd').nil?).to be_truthy
    end
  end

  describe '#paths' do
    it 'should return an empty hash if no urls have been set' do
      expect(described_class.paths).to eq({})
    end
  end

  describe '#new_path_id' do
    it 'should return the correct number of characters' do
      expect(described_class.new_path_id.length).to eq(8)
    end

    it 'should only return characters a-z 0-9' do
      described_class.new_path_id.split(//).each do |character|
        expect(character).to match(/[a-z0-9]/)
      end
    end
  end

  describe '#format_url' do
    it 'should return and empty string if a nil value is passed' do
      expect(Shortener.format_url(nil)).to eq('')
    end

    it 'should return the url parameter if it starts with http:// or https://' do
      expect(Shortener.format_url('http://www.test.com')).to eq('http://www.test.com')
      expect(Shortener.format_url('https://www.test.com')).to eq('https://www.test.com')
    end

    it 'should prepend http:// when the url does not start with http:// or https://' do
      expect(Shortener.format_url('www.test.com')).to eq('http://www.test.com')
    end
  end
end
