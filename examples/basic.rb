# Description: Prints course data to stdout in csv format.
# Usage:       ruby examples/basic.rb > courses_$(date +%Y%m%d).csv

require "osu-cc-scraper"
require "csv"

columns = %w(Department Number Name Term Section Instructor Type Status Capacity Current)
puts columns.to_csv

university = OsuCcScraper::University.new

university.departments.each do |department|
  department.courses.each do |course|
    course.sections.each do |section|
      puts section.to_a.to_csv
    end
  end
end
