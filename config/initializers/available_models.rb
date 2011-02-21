
Datasets = {}

# Iterate through ruby files in the models/ dir and convert the names to a constant.
# Then iterate through these constants and map them into the "Datasets" hash with 
# the tablename as they key
Dir['app/models/*.rb'].map {|f| File.basename(f, '.*').camelize.constantize }.each do |model|
	Datasets[model.table_name] = model
end

