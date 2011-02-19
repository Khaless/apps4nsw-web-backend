class DataWorker < BackgrounDRb::MetaWorker
  set_worker_name :data_worker
  def create(args = nil)
  	add_periodic_timer(60) { refresh_data }
  end

  def refresh_data
  	logger.info "Refreshing Data"
  	begin
			Apps4Nsw::DataLoader.refresh_data
			logger.info "Refreshing Data Completed"
		rescue Exception => e
			logger.info "An Error Occured: " + e.to_s
		end
	end

end

