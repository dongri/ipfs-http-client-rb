# frozen_string_literal: true

require 'spec_helper'

module Ipfs::Commands
  describe Ls do
    describe '.call' do
      let(:client) { double base_url: 'api-url' }
      let(:response) { double body: '{ "Objects": [1, 2] }' }
      let(:node) { 'abc' }

      before :each do
        allow(HTTP).to receive(:get) { response }
      end

      it 'issues the correct request' do
        Ls.call client, node

        expect(HTTP).to have_received(:get).with(
          "api-url/ls?arg=abc"
        )
      end

      it 'returns the result' do
        expect(Ls.call(client, node)).to include('Objects')
      end
    end
  end
end
