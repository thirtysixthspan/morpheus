require './spec/spec_helper'
require './lib/morpheus'

module Morpheus

  describe EmoticonService do

    subject { described_class.new(source) }

    describe 'when a source with no emoticons is provided' do

      let(:source) { 'anyone around?' }

      it 'an empty array is returned' do
        expect(subject.generate).to be_empty
      end

    end

    describe 'when a source with a single emoticon is provided' do

      let(:source) { 'The deploy succeeded (party)' }

      it 'the emoticon name is returned' do
        expect(subject.generate).to include('party')
      end

    end

    describe 'when a source with multiple emoticons is provided' do

      let(:source) { 'The build is broken (fail) (headpalm)' }

      it 'all emoticons are returned in the order specified in the source' do
        expect(subject.generate).to eq(['fail', 'headpalm'])
      end

    end

    describe 'when a multi-line source with multiple emoticons is provided' do

      let(:source) {
        <<-SOURCE
        The build now (green)
        I need an (coffee)
        SOURCE
      }

      it 'all emoticons are returned in the order specified in the source' do
        expect(subject.generate).to eq(['green', 'coffee'])
      end

    end

    describe 'when a source with multiple emoticons without spaces are provided' do

      let(:source) { 'Who wants to get (coffee)(beer)(wine)?' }

      it 'all emoticons are still returned in the order specified in the source' do
        expect(subject.generate).to eq(['coffee', 'beer', 'wine'])
      end

    end

    describe 'when parentheses are used in a sentence' do

      let(:source) { 'want to go running (at the park)?' }

      it 'no emoticons are returned' do
        expect(subject.generate).to be_empty
      end

    end

    describe 'when multiple parentheses are used in a single emoticon' do

      let(:source) { 'The retrospective ((eyes)) is starting!' }

      it 'a single emoticon is returned' do
        expect(subject.generate).to include('eyes')
      end

    end

    describe 'when a source with an emoticon name that is too long is provided' do

      let(:source) { 'I feel (superhappyhappyhappy)' }

      it 'no emoticon is returned' do
        expect(subject.generate).to be_empty
      end

    end

  end

end
