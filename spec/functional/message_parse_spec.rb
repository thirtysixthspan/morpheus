require './spec/spec_helper'
require './lib/morpheus'

describe 'Message#parse' do

  before do
    stub_request(:get, url).to_return(body: "<title>#{title}</title>") if title
    post(
      '/api/v1/message/parse',
      {source: source},
      {content_type: 'application/json'}
    )
  end

  let(:title) {}
  let(:url) {}

  describe 'an empty message' do

    let(:source) { '' }

    it 'generates a bad request response' do
      expect(response_status).to eq(400)
    end

  end

  describe 'a message that contains a mention' do

    let(:source) { '@chris you around?' }

    it 'reports the mention' do
      expect(response_status).to eq(200)
      expect(response_payload).to eq(mentions: ['chris'])
    end

  end

  describe 'a message that contains emoticons' do

    let(:source) { 'Good morning! (megusta) (coffee)' }

    it 'reports the emoticons' do
      expect(response_status).to eq(200)
      expect(response_payload).to eq(emoticons: ['megusta', 'coffee'])
    end

  end

  describe 'a message that contains a link' do

    let(:source) { 'Olympics are starting soon; http://www.nbcolympics.com' }
    let(:url) { 'http://www.nbcolympics.com' }
    let(:title) { '2016 Rio Olympic Games | NBC Olympics' }

    it 'reports the link' do
      expect(response_status).to eq(200)
      expect(response_payload).to eq(links: [
        {
          url: 'http://www.nbcolympics.com',
          title: '2016 Rio Olympic Games | NBC Olympics'
        }
      ])
    end

  end

  describe 'a message that contains a mentions, an emoticon and a link' do

    let(:source) { '@bob @john (success) such a cool feature; https://twitter.com/jdorfman/status/430511497475670016' }
    let(:url) { 'https://twitter.com/jdorfman/status/430511497475670016' }
    let(:title) { '2016 Rio Olympic Games | NBC Olympics' }

    it 'reports the link' do
      expect(response_status).to eq(200)
      expect(response_payload).to eq(
        mentions: ['bob', 'john'],
        emoticons: ['success'],
        links: [
          {
            url: 'https://twitter.com/jdorfman/status/430511497475670016',
            title: title
          }
        ]
      )
    end

  end

end
