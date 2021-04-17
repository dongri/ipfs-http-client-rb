# frozen_string_literal: true

module Ipfs
  module Commands
    class AddDir < Ipfs::Commands::Base
      def self.call(client, dir)
        root = File.dirname dir

        form_files = []
        form_files << HTTP::FormData::Part.new(
          "",
          content_type: 'application/x-directory',
          filename: File.basename(dir)
        )

        Dir["#{dir}/**/*"].each do |file|
          filename = file[(root.size + 1)..file.size]

          if File.directory?(file)
            form_files << HTTP::FormData::Part.new(
              "",
              content_type: 'application/x-directory',
              filename: filename
            )
          else
            form_files << HTTP::FormData::File.new(file, filename: filename)
          end
        end

        response = request(client, "/add?recursive=true",
                 {form: {file: form_files }})

        response.body.to_s.split("\n").map { |s| JSON.parse s }
      end
    end
  end
end
