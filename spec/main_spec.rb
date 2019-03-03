# frozen_string_literal: true

require 'spec_helper'
RSpec.describe Tapiron::Main do
  context 'unset routes' do
    let(:app) do
      router = Tapiron::Router.new
      Tapiron::Main.prepare(router)
    end
    it 'can start server' do
      get '/'
      expect(last_response.status).to eq 404
    end
  end
  context 'set routes' do
    let(:app) do
      router = Tapiron::Router.new
      router.get('/', -> { 'Hello World' })
      router.get('/hello', -> { 'Hello' })
      Tapiron::Main.prepare(router)
    end
    it 'can set route get request' do
      response = get '/'
      expect(response.status).to eq 200
      expect(response.body).to eq 'Hello World'
    end
    it 'can set route other get request' do
      response = get '/hello'
      expect(response.status).to eq 200
      expect(response.body).to eq 'Hello'
    end
    it 'can set route other get request include /' do
      response = get '/hello/'
      expect(response.status).to eq 200
      expect(response.body).to eq 'Hello'
    end
    it 'can set route get request' do
      response = post '/'
      expect(response.status).to eq 404
    end
  end
end
