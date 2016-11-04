class TrialSite < ActiveRecord::Base
	def self.to_csv(options = {})
		CSV.generate(options) do |csv|
			columns = %w(site_name site_city site_state site_zip site_county site_status)
			csv << columns
			all.each do |site|
				csv << site.attributes.values_at(*columns)
			end
		end
	end
end
