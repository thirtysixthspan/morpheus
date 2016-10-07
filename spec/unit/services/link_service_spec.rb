require './spec/spec_helper'
require './lib/morpheus'

module Morpheus

  describe LinkService do

    subject { described_class.new(source) }

    describe 'when a source with no links is provided' do

      let(:source) { 'I had a great weekend!' }
      let(:links) { [] }

      it 'an empty array is returned' do
        expect(subject.generate).to eq([])
      end

    end

    describe 'when a source with a single link is provided' do

      before do
        allow_any_instance_of(PageTitleService)
          .to receive(:fetch)
          .and_return(links.first.title)
      end

      let(:source) { "I had a great weekend! #{links.first.url}" }
      let(:links) {
        [
          Link.new(
            url: 'https://www.instagram.com/p/BLOV8c5ABCD',
            title: 'Instagram | Water Skiing'
          )
        ]
      }

      it 'the link is detected and a page title generated' do
        expect(subject.generate).to eq(links.map(&:to_h))
      end

    end

    describe 'when a source with multiple links is provided' do

      before do
        links.each do |link|
          allow(PageTitleService)
            .to receive(:new)
            .with(link.url)
            .and_return(double(fetch: link.title))
        end
      end

      let(:source) { "Look here #{links.first.url} and here: #{links.last.url}" }
      let(:links) {
        [
          Link.new(
            url: 'https://www.instagram.com/p/BLOV8c5ABCD',
            title: 'Instagram | My Wet Wedding'
          ),
          Link.new(
            url: 'http://myweddingpics.com',
            title: 'My Wedding Pics Website'
          )
        ]
      }

      it 'all links are returned in the order specified in the source' do
        expect(subject.generate).to eq(links.map(&:to_h))
      end

    end

    describe 'when an error occurs while fetching a page title' do

      before do
        allow_any_instance_of(PageTitleService)
          .to receive(:fetch)
          .and_raise(PageTitleError)
      end

      let(:source) { "I had a great weekend! #{links.first.url}" }
      let(:links) {
        [
          Link.new(
            url: 'https://www.instagram.com/p/BLOV8c5ABCD'
          )
        ]
      }

      it 'the page title is not included in the response' do
        expect(subject.generate).to eq(links.map(&:to_h))
      end

    end

  end

end
