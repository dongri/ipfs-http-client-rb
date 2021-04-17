# frozen_string_literal: true

require 'spec_helper'

module Ipfs::Commands
  describe Add do
    describe '.call' do
      let(:client) { double base_url: 'api-url' }
      let(:response) { double body: '{ "Name": "myfilename.txt", "Hash": "myhash" }' }

      before :each do
        allow(HTTP).to receive(:get) { response }
        allow(File).to receive(:open).with('myfilename.txt', {:binmode=>true})
      end

      it 'issues the correct request' do
        Add.call(client, 'myfilename.txt')

        expect(HTTP).to have_received(:get).with(
          'api-url/add', include(:form)
        )
      end

      it 'returns the result' do
        result = Add.call(client, 'myfilename.txt')

        expect(result['Name']).to eq 'myfilename.txt'
        expect(result['Hash']).to eq 'myhash'
      end
    end
  end
end
