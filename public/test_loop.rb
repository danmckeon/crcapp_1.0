require 'nokogiri'
require 'open-uri'
require 'rubygems'
require 'rails'

ClinicalTrialObject = Hash.new	


Dir.foreach(File.join(Rails.root, 'lib', 'data', 'test_data')) do |file|
  doc = Nokogiri::XML(file)  
  ClinicalTrialObject[:org_study_id] = @doc.xpath("//org_study_id").text
  ClinicalTrialObject[:brief_title] = @doc.xpath("//brief_title").text
  ClinicalTrialObject[:description] = @doc.xpath("//description").text
  ClinicalTrialObject[:brief_summary] = @doc.xpath("//brief_summary").text
end

puts ClinicalTrialObject[:org_study_id]
puts ClinicalTrialObject[:brief_title]
puts ClinicalTrialObject[:description]
puts ClinicalTrialPbject[:brief_summary]