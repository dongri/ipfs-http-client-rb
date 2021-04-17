# frozen_string_literal: true

require 'spec_helper'

module Ipfs
  describe Client do
    let(:client) { Client.default }

    describe '.default' do
      it 'creates client with default host and port' do
        client = Client.default

        expect(client.endpoint).to eq Client::DEFAULT_ENDPOINT
      end
    end

    describe '#initialize' do
      it 'allows to set the host and port' do
        client = Client.new 'myhost:3001'

        expect(client.endpoint).to eq 'myhost:3001'
      end
    end

    describe '#base_url' do
      it 'is built out of host, port and prefix' do
        client = Client.new 'myhost:8077'
        expect(client.base_url).to eq(
          "myhost:8077/api/#{Client::API_VERSION}"
        )
      end
    end

    describe '#ls' do
      it 'delegates to LS class' do
        allow(Commands::Ls).to receive(:call)
        node = 'abc'

        client.ls node

        expect(Commands::Ls).to have_received(:call).with client, node
      end
    end

    describe '#cat' do
      it 'delegates to Cat class' do
        allow(Commands::Cat).to receive(:call)
        node = 'abc'

        client.cat node

        expect(Commands::Cat).to have_received(:call).with client, node
      end
    end

    describe '#add' do
      it 'delegates to Add class' do
        allow(Commands::Add).to receive(:call)
        file = 'myfile'

        client.add file

        expect(Commands::Add).to have_received(:call).with client, file
      end
    end
  end
end
