require './spec/spec_helper'
require './lib/morpheus'

module Morpheus

  describe PageTitleService do

    subject { described_class.new(url) }

    describe 'when no url is provided' do

      let(:url) { nil }

      it 'raises an exception when no url is provided' do
        expect { subject }.to raise_error(StandardError)
      end

    end

    describe 'when an invalid url is provided' do

      let(:url) { 'asdff' }
      let(:title) { nil }

      it 'raises an exception when no url is provided' do
        expect { subject.fetch }.to raise_error(StandardError)
      end

    end

    describe 'when a valid url is provided' do

      let(:url) { 'http://www.google.com' }
      let(:title) { 'Google' }

      before do
        allow(Net::HTTP)
          .to receive(:get)
          .and_return(
            <<-HTML
            <title>#{title}</title>
            HTML
          )
      end

      it 'the page title is returned' do
        expect(subject.fetch).to eq(title)
      end

    end


  end

end
