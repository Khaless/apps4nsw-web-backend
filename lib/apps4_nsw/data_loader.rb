
require "rexml/document"

module Apps4Nsw
  module DataLoader
  	
  	include REXML

  	def self.refresh_data

			collections = DataFetcher.fetch_collection_docs

			# Update Vehicles
			ActiveRecord::Base.transaction do
				doc = collections["vehicles"]
				doc.elements.each("vehicleCollectionElement/vehicle") do |e|
					v = Vehicle.find_or_create_by_id(e.attributes["vehicleID"].to_i)
					e.attributes.each do |k, val|
						kname = k.underscore + "="
						v.send(kname,  val) if v.respond_to?(kname)
					end
					v.save
				end
			end

			# Update Bus Stops
			ActiveRecord::Base.transaction do
				doc = collections["stopdescription"]
				doc.elements.each("StopDescriptionList/stop") do |e|
					p e.attributes
					v = Stop.find_or_create_by_id(e.attributes["TSN"].to_i)
					e.attributes.each do |k, val|
						kname = k.underscore + "="
						v.send(kname,  val) if v.respond_to?(kname)
					end
					v.save
				end
			end
		end
	end
end

