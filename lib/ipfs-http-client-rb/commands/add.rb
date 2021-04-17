# frozen_string_literal: true

module Ipfs
  module Commands
    class Add < Ipfs::Commands::Base
      def self.call(client, file)
        response = request(client, "/add", {form: {file: HTTP::FormData::File.new(file)}})
        parse(response.body)
      end
    end
  end
end
