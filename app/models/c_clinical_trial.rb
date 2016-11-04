class CClinicalTrial < ActiveRecord::Base
	def self.to_csv(options = {})
		CSV.generate(options) do |csv|
			columns = %w(nct_id phase recruiting_site_count lead_sponsor_name lead_sponsor_class official_title age_minimum_int age_maximum_int eligibility )
			csv << columns
			all.each do |trial|
				csv << trial.attributes.values_at(*columns)
			end
		end
	end
end