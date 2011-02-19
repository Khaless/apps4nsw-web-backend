namespace :apps4nsw do
	desc "Refresh data from source"
	task :refresh => :environment do
		Apps4Nsw::DataLoader.refresh_data
	end
end
