# frozen_string_literal: true

require 'ipfs-http-client-rb/commands'

module Ipfs
  class Client
    DEFAULT_ENDPOINT = 'http://localhost:5000'.freeze
    API_VERSION = 'v0'.freeze

    attr_reader :endpoint

    def self.default
      new(DEFAULT_ENDPOINT)
    end

    def initialize(endpoint)
      @endpoint = endpoint
    end

    def base_url
      "#{endpoint}/api/#{API_VERSION}"
    end

    def ls(node)
      Commands::Ls.call self, node
    end

    def cat(node)
      Commands::Cat.call self, node
    end

    def cat_to_file(node, path)
      Commands::CatToFile.call self, node, path
    end

    def add(file)
      Commands::Add.call self, file
    end

    def add_dir(dir)
      Commands::AddDir.call self, dir
    end

    def pin_rm(node, recursive: true)
      Commands::PinRm.call self, node, recursive: recursive
    end

    def pin_add(node, recursive: true)
      Commands::PinAdd.call self, node, recursive: recursive
    end
  end
end
