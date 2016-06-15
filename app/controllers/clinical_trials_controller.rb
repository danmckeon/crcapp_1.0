require 'nokogiri'
require 'open-uri'
require 'rubygems'

class ClinicalTrialsController < ApplicationController
  def show
		
  end

  def index
    scrape_clinical_trials
    # @doc = Nokogiri::XML(File.open(File.join(Rails.root, 'lib', 'data', 'test_data', 'NCT00301119.xml')))
    # @org_study_id = @doc.xpath("//org_study_id").text
    # @brief_title = @doc.xpath("//brief_title").text
    # @description = @doc.xpath("//description").text
    # @brief_summary = @doc.xpath("//brief_summary").text
  end
  
  # def loop_through_files
  #   Dir.foreach(File.join(Rails.root, 'lib', 'data', 'test_data')) do |file|
  #     @doc = Nokogiri::XML(file)  
  #     @org_study_id = @doc.xpath("//org_study_id").text
  #     @brief_title = @doc.xpath("//brief_title").text
  #     @description = @doc.xpath("//description").text
  #     @brief_summary = @doc.xpath("//brief_summary").text
  #   end
  # end

  helper_method :loop_through_files




  def open_trial_data_file
  	# Test to ensure data is being read correctly
      File.open(File.join(Rails.root, 'lib', 'data', 'test_data', 'NCT00301119.xml')).read
  #    File.open("/Users/danmckeon/workspace/cancer_resources/lib/data/test_data/NCT00301119.xml").each do |line|
	#			puts line
	#		end
		# Read and parse trial data with nokogiri
#		doc = Nokogiri::XML(File.open("/Users/danmckeon/workspace/cancer_resources/lib/data/test_data/NCT00301119.xml"))
#		doc.xpath('')
  end

  # def run_nokogiri
  #   @doc = Nokogiri::XML(File.open(File.join(Rails.root, 'lib', 'data', 'test_data', 'NCT00301119.xml')))
  #   @org_study_id = @doc.xpath("//org_study_id").text
  #   @brief_title = @doc.xpath("//brief_title").text
  #   @description = @doc.xpath("//description").text
  #   @brief_summary = @doc.xpath("//brief_summary").text
  # end


  
  # helper_method :run_nokogiri
   helper_method :open_trial_data_file

end
