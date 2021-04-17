# frozen_string_literal: true

require 'http'
require 'json'
require 'http/form_data'

module Ipfs
  module Commands
    class Error < StandardError; end

    class Base
      def self.request(client, path_with_query, args = nil)
        url = "#{client.base_url}#{path_with_query}"
        response = HTTP.post(*[url, args].compact)
        if response.code >= 200 && response.code <= 299
          response
        else
          raise Error, response.body
        end
      end

      def self.parse(str)
        JSON.parse(str)
      end
    end
  end
end
