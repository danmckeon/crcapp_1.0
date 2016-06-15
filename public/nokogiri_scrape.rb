require 'nokogiri'


url = 'http://disneyauditions.com/audition-calendar/'
data = Nokogiri::HTML(open(url))
auditions = data.css('.audtion')


auditions.each do |audition|
    puts audition.css('.name').text
    puts audition.css('.businessunit').text 
    puts audition.css('.location').text
    puts audition.css('.venue').text
    puts audition.css('.talent_type').text
    puts audition.css('.start_date').text
    puts audition.css('.start_time').text
    puts audition.css('.time_zone').text
end