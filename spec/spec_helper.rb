require 'bundler'
require 'webmock/rspec'

Bundler.setup :default, :test
Bundler.require :default, :test

ENV['RACK_ENV'] = 'test'

module ApiTesting
  include Rack::Test::Methods

  def app
    Praxis::Application.instance
  end

  def response_status
    last_response.status
  end

  def response_payload
    JSON.parse(last_response.body).deep_symbolize_keys
  end
end

RSpec.configure do |config|
  config.include ApiTesting
  config.formatter = :documentation
  config.before(:suite) do
    Praxis::Application.instance.setup
  end
end
