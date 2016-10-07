require './spec/spec_helper'
require './lib/morpheus'

module Morpheus

  describe MentionService do

    subject { described_class.new(source) }

    describe 'when a source with no mentions is provided' do

      let(:source) { 'anyone around?' }

      it 'an empty array is returned' do
        expect(subject.generate).to eq([])
      end

    end

    describe 'when a source with a single mention is provided' do

      let(:source) { '@chris you around?' }

      it 'the mention is returned' do
        expect(subject.generate).to include('chris')
      end

    end

    describe 'when a source with multiple mentions is provided' do

      let(:source) { '@chris you around? @tommy and @mark want to get coffee.' }

      it 'all mentions are returned in the order specified in the source' do
        expect(subject.generate).to eq(['chris', 'tommy', 'mark'])
      end

    end

    describe 'when a multi-line source with multiple mentions is provided' do

      let(:source) {
        <<-SOURCE
        @chris you around?
        @tommy and @mark want to get coffee.
        SOURCE
      }

      it 'all mentions are returned in the order specified in the source' do
        expect(subject.generate).to eq(['chris', 'tommy', 'mark'])
      end

    end

    describe 'when a source with multiple mentions not space separated is provided' do

      let(:source) { '@chris@tommy@mark want to get coffee?' }

      it 'all mentions are still returned in the order specified in the source' do
        expect(subject.generate).to eq(['chris', 'tommy', 'mark'])
      end

    end

    describe 'when a mention mark is used in a sentence' do

      let(:source) { 'want to meet @ the coffee shop?' }

      it 'no mentions are returned' do
        expect(subject.generate).to_not be_present
      end

    end

    describe 'when multiple mention marks are used in a single mention' do

      let(:source) { 'want to meet @@mark at the coffee shop?' }

      it 'a single mention is returned' do
        expect(subject.generate).to include('mark')
      end

    end

  end

end
