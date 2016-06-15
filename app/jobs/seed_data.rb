# require 'rubygems'
# require 'rails'
# require 'net/http'
# require 'open-uri'

# # Dir.mkdir(Rails.root.join('lib', 'data', 'newfolder'))

# UPLOAD_DIR_ROOT = "CTDOTGOV_UPLOAD_" #Root name of directory for ClinicalTrials.gov downloads
# UPLOAD_URL = "https://clinicaltrials.gov/ct2/results?term=&recr=Recruiting&cond=hand+cancer&studyxml=true"

# timestamp = Time.now.to_i.to_s

# upload_dir_full_name = UPLOAD_DIR_ROOT + timestamp


# #Create necessary directories

# Dir.mkdir('/Users/danmckeon/workspace/cancer_resources/lib/data/' + upload_dir_full_name) 
# Dir.mkdir('/Users/danmckeon/workspace/cancer_resources/lib/data/' + upload_dir_full_name + '/Zip') 
# Dir.mkdir('/Users/danmckeon/workspace/cancer_resources/lib/data/' + upload_dir_full_name + '/XML') 

# # Download zip file to directory


# File.open("/my/local/path/sample.flv", "wb") do |saved_file|
#   # the following "open" is provided by open-uri
#   open("http://somedomain.net/flv/sample/sample.flv", "rb") do |read_file|
#     saved_file.write(read_file.read)
#   end
# end

# Net::HTTP.start("clinicaltrials.gov") do |http|
#     resp = http.get("/ct2/results?term=&recr=Recruiting&cond=hand+cancer&studyxml=true")
#     open("search_result.zip", "wb") do |file|
#         file.write(resp.body)
#     end
# end


# Net::HTTP.get('https://clinicaltrials.gov/ct2/results?term=&recr=Recruiting&cond=hand+cancer&studyxml=true', '/search_result.zip') # => String

# Net::HTTP.start("https://clinicaltrials.gov") do |http|
#     resp = http.get("/ct2/results?term=&recr=Recruiting&cond=cancer&studyxml=true")
#     open("search_result.zip", "wb") do |file|
#         file.write(resp.body)
#     end
# end


# def download_zip file_name
# 	url = ‘http://www.example.com/download/zip/&#8217;
# 	#the website will drop the connection without the user-agent and other stuff.
# 	open( url + file_name, “User-Agent” => “Mozilla/5.0 (X11; U; Linux x86_64; en-US; rv:1.9.1.9) Gecko/20100402 Ubuntu/9.10 (karmic) Firefox/3.5.9”, “From” => “foo@bar.com”, “Referer” => “http://www.foo.bar/&#8221;) {|zf|
# 	#zf is an instance of class Tempfile
# 	Zip::ZipFile.open(zf.path) do |zipfile|
# 		#zipfile.class is Zip::ZipFile
# 		zipfile.each{|e|
# 		#e is an instance of Zip::ZipEntry
# 		fpath = File.join(file_name, e.to_s)
# 		FileUtils.mkdir_p(File.dirname(fpath))
# 		#the block is for handling an existing file. returning true will overwrite the files.
# 		zipfile.extract(e, fpath){ true }
# 		}
# 		end
# 	}
# end