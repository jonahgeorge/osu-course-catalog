# Description: Prints course data to stdout in csv format.
# Usage:       ruby examples/basic.rb > courses_$(date +%Y%m%d).csv

require "osu-cc-scraper"
require "csv"

puts %w(Department Number Name Term Section Instructor
        Campus Type Status Capacity Current).to_csv

university = OsuCcScraper::University.new

university.departments.each do |department|
  department.courses.each do |course|
    course.sections.each do |section|
      puts section.to_a.to_csv
    end
  end
end
