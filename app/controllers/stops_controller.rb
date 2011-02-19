class StopsController < ApplicationController

	# GET /stops/:id
	def show
		v = Stop.find_by_id(params[:id])
		render :json => v
	end

	def index
		collection = Stop.find(:all)
		render :json => collection
	end
	
	# GET /stop/by_location/:lng,:lat
	def by_location
		point = GeoKit::LatLng.new(params[:lat], params[:lng])
		collection = Stop.within(5, :origin => point)
		render :json => collection
	end

end

