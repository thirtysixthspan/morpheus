require './spec/spec_helper'
require './lib/morpheus'

module Morpheus

  describe Link do

    subject { described_class.new(url: url) }

    before do
      allow(PageTitleService)
        .to receive(:new)
        .and_return(double(fetch: title))
    end

    describe 'when a url is provided' do

      let(:url) { 'http://www.google.com' }
      let(:title) { 'Google' }

      it 'the url can be queried' do
        expect(subject.url).to eq(url)
      end

      it 'the page title can be queried' do
        expect(subject.title).to eq(title)
      end

      it 'the link can be converted to a hash' do
        expect(subject.to_h).to eq(url: url, title: title)
      end

    end

    describe 'when an invalid url is provided' do

      let(:url) { 'asdff' }
      let(:title) { nil }

      it 'the url can be queried' do
        expect(subject.url).to eq(url)
      end

      it 'the page title is nil' do
        expect(subject.title).to eq(title)
      end

      it 'the title is absent when the link is converted to a hash' do
        expect(subject.to_h).to eq(url: url)
      end

    end

  end

end
