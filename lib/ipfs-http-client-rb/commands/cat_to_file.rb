# frozen_string_literal: true

module Ipfs
  module Commands
    class CatToFile < Ipfs::Commands::Base
      def self.call(client, node, path)
        response = request(client, "/cat?arg=#{node}")

        begin
          file = File.open(path, 'wb')
          while (chunk = response.body.readpartial)
            file.write chunk
          end
        ensure
          file.close if file
        end

        true
      end
    end
  end
end
