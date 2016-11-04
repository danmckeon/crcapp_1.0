json.array!(@trial_sites) do |trial_site|
  json.extract! trial_site, :id, :site_name, :site_city, :site_state, :site_zip, :site_county, :site_status
  json.url trial_site_url(trial_site, format: :json)
end
