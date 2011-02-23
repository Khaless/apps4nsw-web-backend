
require 'rubygems'
require 'zip/zip'
require 'fileutils'
require 'open-uri'
require 'rexml/document'

module Apps4Nsw
  module DataFetcher

  	include REXML
		URLs = [
			'http://data.nsw.gov.au/redirect.php?title=Real-time+bus+stops+and+vehicles+data.&file=XML'
			#'http://data.nsw.gov.au/redirect.php?title=Real-time+bus+stop+description+data.&file=XML'
		]

  	# Grab the data file and yield the individual XML doc's inside it
		def self.fetch_file()
			URLs.each do |url|
				open(url, 'User-Agent' => 'Mozilla/5.0 (X11; U; Linux x86_64; en-US; rv:1.9.1.9) Gecko/20100402 Ubuntu/9.10 (karmic) Firefox/3.5.9') do |tf|
					# tf is a Tempfile object of the downloaded zip file
					Zip::ZipFile.open(tf.path) do |archive|
						archive.each do |entry|
							archive.get_input_stream(entry.to_s) do |file|
								xml = Document.new file.read
								yield entry.to_s, xml
							end
						end
					end
				end
			end
		end

		def self.fetch_collection_docs
			collections = {}
			fetch_file() do |file, xmldoc|
				collections[File.basename(file, '.*')] = xmldoc
			end
			collections
		end

	end
end
