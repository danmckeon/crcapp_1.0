require 'rubygems'
require 'rails'
require 'net/http'
require 'open-uri'
require 'fileutils'
require 'zip'
require 'nokogiri'
require 'rails_helper'

TARGET_FILE_PATH = '/Users/danmckeon/workspace/cancer_research_connect/lib/data/CTDOTGOV_UPLOAD_1476145970/XML/NCT02364999.xml'

# TARGET_FILE = 'NCT02364999.xml'
# File.join('Users', 'danmckeon', 'workspace', 'cancer_research_conmect', 'lib', 'data', 'CTDOTGOV_UPLOAD_1476145970', 'XML', TARGET_FILE)



def parse_trial_sites(xml_file)
	@trial_site_record = TrialSite.new
	@trial_site_record[:site_name] = xml_file.xpath("//location//facility//name").text
	@trial_site_record[:site_city] = xml_file.xpath("//location//facility//address//city").text
	@trial_site_record[:site_state] = xml_file.xpath("//location//facility//address//state").text
	@trial_site_record[:site_zip] = xml_file.xpath("//location//facility//address//zip").text
	@trial_site_record[:site_county] = xml_file.xpath("//location//facility//address//country").text
	@trial_site_record[:site_status] = xml_file.xpath("//location//status").text
	return @trial_site_record
end

ctxml_noko = Nokogiri::XML(File.open(TARGET_FILE_PATH))
@site_record = TrialSite.new
@site_record = parse_trial_sites(ctxml_noko)
@site_record.save