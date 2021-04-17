# frozen_string_literal: true

require 'acceptance_helper'

describe 'cat command' do

  let(:ipfs) { ipfs_client }
  let(:node) { 'QmNkJjVzQP9nzuZub4R5jPw7GrotYwKkHgEqMSUfW6jcPt' }

  it 'issues the right API request' do
    ipfs.cat node

    expect(WebMock).to have_requested(
      :get, "#{base_url}/cat?arg=#{node}"
    )
  end

  it 'returns the result' do
    result = ipfs.cat node

    expect(result).to eq 'This is just some text.'
  end

end
