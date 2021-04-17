# frozen_string_literal: true

module Ipfs
  module Commands
    class PinAdd < Ipfs::Commands::Base
      def self.call(client, node, recursive: false)
        response = request(client, "/pin/add?arg=#{node}&recursive=#{recursive}")
        parse(response.body)
      end
    end
  end
end
