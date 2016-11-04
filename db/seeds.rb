require 'rubygems'
require 'rails'
require 'net/http'
require 'open-uri'
require 'fileutils'
require 'zip'
require 'nokogiri'

public

  def assign_parent_dir_name
    timestamp = Time.now.to_i.to_s
    parent_dir_name = "CTDOTGOV_UPLOAD_" + timestamp
#    parent_dir_name = "CTDOTGOV_UPLOAD_1465941648" # Toggle this row comment and 2 rows above with internet connection
    return parent_dir_name
  end

  def create_upload_directories(parent_dir_path, zip_dir_path, xml_dir_path)
    Dir.mkdir(parent_dir_path) 
    Dir.mkdir(zip_dir_path) 
    Dir.mkdir(xml_dir_path)
  end

  def download_zip_file(upload_url, zip_dir_path, xml_dir_path)
    open(upload_url) do |zip_file|
      FileUtils.cp(zip_file, zip_dir_path)
      Zip::File.open(zip_file) do |zip|
        zip.each do |xml_file|
          xml_file_path = xml_dir_path + xml_file.name
          xml_file.extract(xml_file_path)     
        end
      end
    end
  end

  def parse_xml_file(file_to_parse)
    @parsed_file = CClinicalTrial.new 
    @parsed_file[:org_study_id] = file_to_parse.xpath("//id_info//org_study_id").text
    @parsed_file[:secondary_id] = file_to_parse.xpath("//id_info//secondary_id").text
    @parsed_file[:nct_id] = file_to_parse.xpath("//nct_id").text
    @parsed_file[:nct_alias] = file_to_parse.xpath("//nct_alias").text
    @parsed_file[:brief_title] = file_to_parse.xpath("//brief_title").text
    @parsed_file[:official_title] = file_to_parse.xpath("//official_title").text
    @parsed_file[:lead_sponsor_name] = file_to_parse.xpath("//sponsors//lead_sponsor//agency").text
    @parsed_file[:lead_sponsor_class] = file_to_parse.xpath("//sponsors//lead_sponsor//agency_class").text
    @parsed_file[:brief_summary] = file_to_parse.xpath("//brief_summary//textblock").text
    @parsed_file[:detailed_description] = file_to_parse.xpath("//detailed_description//textblock").text
    @parsed_file[:overall_status] = file_to_parse.xpath("//overall_status").text
    @parsed_file[:start_date] = file_to_parse.xpath("//start_date").text
    @parsed_file[:phase] = file_to_parse.xpath("//phase").text
    @parsed_file[:study_type] = file_to_parse.xpath("//study_type").text
    @parsed_file[:study_design] = file_to_parse.xpath("//study_design").text
    @parsed_file[:primary_outcome_measure] = file_to_parse.xpath("//primary_outcome//measure").text
    @parsed_file[:primary_outcome_time_frame] = file_to_parse.xpath("//primary_outcome//time_frame").text
    @parsed_file[:primary_outcome_safety_issue] = file_to_parse.xpath("//primary_outcome//safety_issue").text
    @parsed_file[:secondary_outcome_measure] = file_to_parse.xpath("//secondary_outcome//measure").text
    @parsed_file[:secondary_outcome_time_frame] = file_to_parse.xpath("//secondary_outcome//time_frame").text
    @parsed_file[:secondary_outcome_safety_issue] = file_to_parse.xpath("//secondary_outcome//safety_issue").text
    @parsed_file[:number_of_groups] = file_to_parse.xpath("//number_of_arms").text 
    @parsed_file[:enrollment_number] = file_to_parse.xpath("//enrollment").text
    @parsed_file[:condition] = file_to_parse.xpath("//condition").text
    @parsed_file[:arm_group_label] = file_to_parse.xpath("//arm_group//arm_group_label").text
    @parsed_file[:arm_group_description] = file_to_parse.xpath("//arm_group//description").text  
    @parsed_file[:eligibility] = file_to_parse.xpath("//eligibility//criteria//textblock").text
    @parsed_file[:gender] = file_to_parse.xpath("//eligibility//gender").text
    @parsed_file[:minimum_age] = file_to_parse.xpath("//eligibility//minimum_age").text
    @parsed_file[:maximum_age] = file_to_parse.xpath("//eligibility//maximum_age").text
    @parsed_file[:overall_official] = file_to_parse.xpath("//overall_official").text 
    @parsed_file[:overall_contact] = file_to_parse.xpath("//overall_contact").text
    @parsed_file[:overall_contact_backup] = file_to_parse.xpath("//overall_contact_backup").text
    @parsed_file[:contact] = file_to_parse.xpath("//contact").text
    @parsed_file[:contact_backup] = file_to_parse.xpath("//contact_backup").text
#    location_array_xml = file_to_parse.xpath("//location//facility").text
    @parsed_file[:location_name] = file_to_parse.xpath("//location//facility//name").map{ |name| name.text } #NOTE THIS CODES AS STRING, NOT ARRAY, DUE TO STRING CLASSIFICATION IN MIGRATION
    @parsed_file[:location_city] = file_to_parse.xpath("//location//facility//address//city").map{ |city| city.text }  #NOTE THIS CODES AS STRING, NOT ARRAY
    @parsed_file[:location_state] = file_to_parse.xpath("//location//facility//address//state").map{ |state| state.text }  #NOTE THIS CODES AS STRING, NOT ARRAY
    @parsed_file[:location_zip] = file_to_parse.xpath("//location//facility//address//zip").map{ |zip| zip.text }  #NOTE THIS CODES AS STRING, NOT ARRAY
    @parsed_file[:location_country] = file_to_parse.xpath("//location//facility//address//country").map{ |country| country.text }  #NOTE THIS CODES AS STRING, NOT ARRAY
    @parsed_file[:location_status] = file_to_parse.xpath("//location//status").map{ |location_status| location_status.text }  #NOTE THIS CODES AS STRING, NOT ARRAY
    @parsed_file[:recruiting_site_count] = calculate_sites_recruiting(file_to_parse.xpath("//location//status").map{ |location_status| location_status.text })
    @parsed_file[:results_reference_citation] = file_to_parse.xpath("//results_reference//citation").text
    @parsed_file[:results_reference_PMID] = file_to_parse.xpath("//results_reference//pmid").text
    @parsed_file[:verification_date] = file_to_parse.xpath("//verification_date").text
    @parsed_file[:lastchanged_date] = file_to_parse.xpath("//lastchanged_date").text
    @parsed_file[:firstreceived_date] = file_to_parse.xpath("//firstreceived_date").text
    @parsed_file[:responsible_party_type] = file_to_parse.xpath("//responsible_party_type").text
    @parsed_file[:keyword] = file_to_parse.xpath("//keyword").text
    @parsed_file[:is_fda_regulated] = file_to_parse.xpath("//is_fda_regulated").text
    @parsed_file[:has_expanded_access] = file_to_parse.xpath("//has_expanded_access").text
    @parsed_file[:condition_browse_mesh_term] = file_to_parse.xpath("//condition_browse//mesh_term").text
    @parsed_file[:age_minimum_int] = calculate_min_age_int(@parsed_file[:minimum_age])
    @parsed_file[:age_maximum_int] = calculate_max_age_int(@parsed_file[:maximum_age])
    return @parsed_file
  end

# def find_location_name(location_array_xml)
#   location_name_array = /^.+name>(.+)<.+$/.match(location_array_xml)
# end



def calculate_min_age_int(min_age_string)
  min_age_string_array = min_age_string.split(' ')
  if min_age_string_array[1] == "Years"
    age_minimum_int = min_age_string_array[0].to_i
  else
    age_minimum_int = 0
  end
  return age_minimum_int
end

def calculate_max_age_int(max_age_string)
  max_age_string_array = max_age_string.split(' ')
  if max_age_string_array[1] == "Years"
    age_maximum_int = max_age_string_array[0].to_i
  else
    age_maximum_int = 150
  end
  return age_maximum_int
end

def calculate_sites_recruiting(location_status_array)
#  Potential statuses for sites ["Recruiting", "Active, not recruiting", "Not yet recruiting", , "Enrolling by invitation", "Completed", "Terminated", "Withdrawn", "Suspended"]
  site_status_count = Hash.new(0)
  location_status_array.each do |status|
    site_status_count[status] += 1
  end
  return site_status_count["Recruiting"]
end

# Trial sites function

def parse_trial_sites(xml_file)
  @location_array = xml_file.xpath("//location").map { |location| location }
  @location_array.each do |entry|   
    if (entry.at("country").text == "United States")
      @trial_site_record = TrialSite.new
      @trial_site_record[:site_name] = read_entry(entry, "name")
      @trial_site_record[:site_city] = read_entry(entry, "city")
      @trial_site_record[:site_state] = read_entry(entry, "state")
      @trial_site_record[:site_zip] = read_entry(entry, "zip")
      @trial_site_record[:site_county] = read_entry(entry, "country")
      @trial_site_record[:site_status] = read_entry(entry, "status")
      @trial_site_record.save
    end
  end
end

def read_entry(entry, tag)
  if entry.at(tag) != nil
    return entry.at(tag).text
  end
end

# Populate trial sites

#TARGET_FILE_PATH = '/Users/danmckeon/workspace/cancer_research_connect/lib/data/CTDOTGOV_UPLOAD_1476145970/XML/NCT02364999.xml'



#ctxml_noko = Nokogiri::XML(File.open(TARGET_FILE_PATH))





# Define Constants

SHORT_SAMPLE_UPLOAD_URL = "https://clinicaltrials.gov/ct2/results?term=&recr=Recruiting&cntry1=NA%3AUS&cond=hand+cancer&studyxml=true"
LONGER_SAMPLE_UPLOAD_URL = %q[https://clinicaltrials.gov/ct2/results?term=&recr=Recruiting&cntry1=NA%3AUS&cond="mouth+cancer"&studyxml=true]
LUNG_CANCER_UPLOAD_URL = %q[https://clinicaltrials.gov/ct2/results?term=&recr=Recruiting&cntry1=NA%3AUS&cond="lung+cancer"&phase=1&phase=2&studyxml=true]
COLORECTAL_CANCER_UPLOAD_URL = %q[https://clinicaltrials.gov/ct2/results?term=&recr=Recruiting&cntry1=NA%3AUS&cond="colon cancer"+OR+"rectal cancer"+OR+"colorectal cancer"+OR+"rectum cancer"&phase=1&phase=2&studyxml=true]
LEUKEMIA_UPLOAD_URL = %q[https://clinicaltrials.gov/ct2/results?term=&recr=Recruiting&cntry1=NA%3AUS&cond="leukemia"&phase=1&phase=2&studyxml=true]
FULL_UPLOAD_URL = "https://clinicaltrials.gov/ct2/results?term=&recr=Recruiting&cntry1=NA%3AUS&studyxml=true"


# Assign variables

parent_dir_name = assign_parent_dir_name
parent_dir_path = Rails.root.join('lib', 'data', parent_dir_name)
zip_dir_path = Rails.root.join('lib', 'data', parent_dir_name, 'ZIP')
xml_dir_path = Rails.root.join('lib', 'data', parent_dir_name, 'XML')
expl_xml_dir_path = xml_dir_path + '*.xml'

# Run methods

# Toggle comment on two lines below with internet connection

create_upload_directories(parent_dir_path, zip_dir_path, xml_dir_path) # Create necessary directories for upload

download_zip_file(LEUKEMIA_UPLOAD_URL, zip_dir_path, xml_dir_path) # Download zip file to directory and unzip

CClinicalTrial.destroy_all # Clear database

TrialSite.destroy_all # Clear database

# Parse XML files

Dir.glob(expl_xml_dir_path) do |xml_file|  
  xml_file_noko = Nokogiri::XML(File.open(xml_file))
  @ct_record = CClinicalTrial.new
  @ct_record = parse_xml_file(xml_file_noko)
  @ct_record.save
  parse_trial_sites(xml_file_noko)
end






# Misc Notes:
  # Root file path on my computer: '/Users/danmckeon/workspace/cancer_resources/lib/data/'

# TODO:
  # Run migrations for below and heed notes within parse_xml_file method
  # TODO: Add arm_group_type as a field
  # TODO: Add collaborator info as a field
  # TODO: Add download date
  # TODO: Add source
  # TODO: Add oversight info
  # TODO: Add completion date and primary completion date
  # TODO: Add primary outcome description and secondary outcome description
  # TODO: Ensure Number of groups and number of arms are same thing
  # TODO: Add arm_group_type as a field
  # TODO: Add intervention data
  # TODO: Add eligibility (?) as field and sampling_method
  # TODO: Add reference citation (no results, would take study not yet finished)
  # Parse file according to XML categories
  # Add more responsible party info
  # Figure out how to only update by date uploaded





# Creating sample users for application

# User.create!(name:  "Example User",
#              email: "example@railstutorial.org",
#              password:              "foobar",
#              password_confirmation: "foobar",
#              admin:     true,
#              activated: true,
#              activated_at: Time.zone.now)

# 99.times do |n|
#   name  = Faker::Name.name
#   email = "example-#{n+1}@railstutorial.org"
#   password = "password"
#   User.create!(name:  name,
#                email: email,
#                password:              password,
#                password_confirmation: password,
#                activated: true,
#                activated_at: Time.zone.now)
# end