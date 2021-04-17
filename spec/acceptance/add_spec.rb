# frozen_string_literal: true

require 'acceptance_helper'

describe 'add command' do
  let(:ipfs) { ipfs_client }
  let(:node) { 'QmZyBusQkNBXUqJV6JA1bPS7QTgngGKjdBYrdPatoqtHW9' }
  let(:file) { double('myfilename.txt') }

  before do
    allow(File).to receive(:open).and_return(file)
    allow(file).to receive(:binmode)
    allow(file).to receive(:<<)
    allow(file).to receive(:rewind)
    allow(file).to receive(:read)
  end

  it 'issues the right API request' do
    ipfs.add 'myfilename.txt'
    expect(WebMock).to have_requested(
      :get, "#{base_url}/add"
    )
  end

  it 'returns the result' do
    result = ipfs.add 'myfilename.txt'
    expect(result['Name']).to eq('myfilename.txt')
    expect(result['Hash']).to eq(node)
  end
end
