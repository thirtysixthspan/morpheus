require './spec/spec_helper'
require './lib/morpheus'

module Morpheus

  describe ParsingService do

    subject { described_class.new(source) }

    describe 'when no source is provided' do

      let(:source) { nil }

      it 'raises an exception' do
        expect { subject }.to raise_error(ParseError)
      end

    end

  end

end
