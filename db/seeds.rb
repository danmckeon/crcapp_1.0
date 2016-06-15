# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
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
    @parsed_file[:criteria] = file_to_parse.xpath("//eligibility//criteria//textblock").text
    @parsed_file[:gender] = file_to_parse.xpath("//eligibility//gender").text
    @parsed_file[:minimum_age] = file_to_parse.xpath("//eligibility//minimum_age").text
    @parsed_file[:maximum_age] = file_to_parse.xpath("//eligibility//maximum_age").text
    @parsed_file[:healthy_volunteers] = file_to_parse.xpath("//eligibility//healthy_volunteers").text
    # TODO: REMOVE ALL COLUMNS WITH NAME, ROLE, AFFILIATION...
    #TODO: ADD COLUMNS FOR OVERALL_OFFICIAL, OVERALL_CONTACT, OVERALL_CONTACT_BACKUP, CONTACT, CONTACT_BACKUP
    @parsed_file[:overall_official_name] = file_to_parse.xpath("//overall_official//last_name").text # TODO: Ensure last_name is bringing up full name for all studies
    @parsed_file[:overall_official_role] = file_to_parse.xpath("//overall_official//role").text
    @parsed_file[:overall_official_affiliation] = file_to_parse.xpath("//overall_official//affiliation").text
    @parsed_file[:overall_contact_name] = file_to_parse.xpath("//overall_contact//last_name").text
    @parsed_file[:overall_contact_phone] = file_to_parse.xpath("//overall_contact//phone").text
    @parsed_file[:overall_contact_email] = file_to_parse.xpath("//overall_contact//email").text
    @parsed_file[:overall_contact_backup_name] = file_to_parse.xpath("//overall_contact_backup").text # See what happens with just this
    @parsed_file[:overall_contact_backup_phone] = file_to_parse.xpath("//overall_contact//phone").text
    @parsed_file[:overall_contact_backup_email] = file_to_parse.xpath("//overall_contact//email").text
    @parsed_file[:location_name] = file_to_parse.xpath("//location//facility//name").text
    @parsed_file[:location_city] = file_to_parse.xpath("//location//facility//address//city").text
    @parsed_file[:location_state] = file_to_parse.xpath("//location//facility//address//state").text
    @parsed_file[:location_zip] = file_to_parse.xpath("//location//facility//address//zip").text
    @parsed_file[:location_country] = file_to_parse.xpath("//location//facility//address//country").text
    @parsed_file[:location_country] = file_to_parse.xpath("//location//facility//address//country").text
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
    return @parsed_file
  end




SHORT_SAMPLE_UPLOAD_URL = "https://clinicaltrials.gov/ct2/results?term=&recr=Recruiting&cntry1=NA%3AUS&cond=hand+cancer&studyxml=true"
LONGER_SAMPLE_UPLOAD_URL = "https://clinicaltrials.gov/ct2/results?term=&recr=Recruiting&cntry1=NA%3AUS&cond=mouth+cancer&studyxml=true"
FULL_UPLOAD_URL = "https://clinicaltrials.gov/ct2/results?term=&recr=Recruiting&cntry1=NA%3AUS&studyxml=true"

# Assign variables

parent_dir_name = assign_parent_dir_name
parent_dir_path = Rails.root.join('lib', 'data', parent_dir_name)
zip_dir_path = Rails.root.join('lib', 'data', parent_dir_name, 'ZIP')
xml_dir_path = Rails.root.join('lib', 'data', parent_dir_name, 'XML')
expl_xml_dir_path = xml_dir_path + '*.xml'

# Run methods

create_upload_directories(parent_dir_path, zip_dir_path, xml_dir_path) # Create necessary directories for upload

download_zip_file(LONGER_SAMPLE_UPLOAD_URL, zip_dir_path, xml_dir_path) # Download zip file to directory and unzip


# FileUtils.destroy_all #Trying to clear cache
#Zip.destroy_all #Trying to clear cache
CClinicalTrial.destroy_all # Clear database

# Parse XML files

Dir.glob(expl_xml_dir_path) do |xml_file|  
  xml_file_noko = Nokogiri::XML(File.open(xml_file))
  @ct_record = CClinicalTrial.new
  @ct_record = parse_xml_file(xml_file_noko)
  @ct_record.save
end

# Meaningless note

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