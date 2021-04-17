# frozen_string_literal: true

require 'acceptance_helper'

describe 'ls command' do
  let(:ipfs) { ipfs_client }
  let(:node) { 'QmNkJjVzQP9nzuZub4R5jPw7GrotYwKkHgEqMSUfW6jcPt' }

  it 'issues the right API request' do
    ipfs.ls node

    expect(WebMock).to have_requested(
      :get, "#{base_url}/ls?arg=#{node}"
    )
  end

  it 'parses the result' do
    result = ipfs.ls node
    puts result

    expect(result['Objects'].map { |node| node['Hash'] }).to eq ['Hash1', 'Hash2']
    expect(result['Objects'].first['Links'].first['Name']).to eq 'Link'
    expect(result['Objects'].first['Links'].first['Hash']).to eq 'Hash3'
    expect(result['Objects'].first['Links'].first['Size']).to eq 500
  end
end
