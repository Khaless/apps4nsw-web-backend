class DataController < ApplicationController

	before_filter :select_dataset, :except => [ :index ]

	# GET /:dataset/:id
	def show
		v = @dataset.find_by_id(params[:id])
		render :json => v
	end

	# GET /:dataset
	def all
		collection = @dataset.find(:all)
		render :json => collection
	end
	
	# GET /:dataset/by_location/:lng,:lat
	def by_location
		point = GeoKit::LatLng.new(params[:lat], params[:lng])
		collection = @dataset.within(5, :origin => point)
		render :json => collection
	end

	def index
		render :json => Datasets.map{ |k, v| { k => v.dataset_name } }
	end

	private

	def select_dataset
		@dataset = Datasets[params[:dataset]] || nil
	end

end

