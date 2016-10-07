require './spec/spec_helper'
require './lib/morpheus'

module Morpheus

  describe Metadata do

    subject { described_class.new(source) }

    before do
      allow_any_instance_of(MentionService).to receive(:generate).and_return(mentions)
      allow_any_instance_of(EmoticonService).to receive(:generate).and_return(emoticons)
      allow_any_instance_of(LinkService).to receive(:generate).and_return(links)
    end

    describe 'when a message source is provided' do

      let(:source) { '@chris you around? @tommy and @mark want to get (coffee) at http://starbucks.com' }
      let(:mentions) { ['chris', 'tommy', 'mark'] }
      let(:emoticons) { ['coffee'] }
      let(:links) { [{url: 'http://starbucks.com', title: 'Starbucks Coffee'}] }

      it 'the source can be queried' do
        expect(subject.source).to eq(source)
      end

      it 'the mentions can be queried' do
        expect(subject.mentions).to eq(mentions)
      end

      it 'the emoticons can be queried' do
        expect(subject.emoticons).to eq(emoticons)
      end

      it 'the links can be queried' do
        expect(subject.links).to eq(links)
      end

      it 'the metadata can be converted to a hash' do
        expect(subject.to_h).to eq(mentions: mentions, emoticons: emoticons, links: links)
      end

    end

    describe 'when a message source with only mentions is provided' do

      let(:source) { '@chris you around? @tommy and @mark want to get coffee?' }
      let(:mentions) { ['chris', 'tommy', 'mark'] }
      let(:emoticons) { nil }
      let(:links) { nil }

      it 'the metadata hash does not include emoticon or links attributes' do
        expect(subject.to_h).to eq(mentions: mentions)
      end

    end

    describe 'when a message source with only emoticons is provided' do

      let(:source) { '(coffee) (car) (happy)' }
      let(:mentions) { nil }
      let(:emoticons) { ['coffee', 'car', 'happy'] }
      let(:links) { nil }

      it 'the metadata hash does not include mentions or links attributes' do
        expect(subject.to_h).to eq(emoticons: emoticons)
      end

    end

    describe 'when a message source with only links is provided' do

      let(:source) { 'http://starbucks.com' }
      let(:mentions) { nil }
      let(:emoticons) { nil }
      let(:links) { [{url: 'http://starbucks.com', title: 'Starbucks Coffee'}] }

      it 'the metadata hash does not include emoticon or mentions attributes' do
        expect(subject.to_h).to eq(links: links)
      end

    end

  end

end
