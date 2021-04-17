# frozen_string_literal: true

module Ipfs
  module Commands
    class Ls < Ipfs::Commands::Base
      def self.call(client, node)
        response = request(client, "/ls?arg=#{node}")
        parse(response.body)
      end
    end
  end
end
