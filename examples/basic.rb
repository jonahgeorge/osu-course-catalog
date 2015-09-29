#!/usr/bin/env ruby

# Description: Prints course data to stdout in csv format.
# Usage:       ruby basic.rb > courses_$(date +%Y%m%d).csv

require "osu-cc-scraper"
require "csv"

OsuCcScraper::Department.all.each do |department|
  department.courses.each do |course|
    course.sections.each do |section|
      $stdout.puts(section.to_a.to_csv)
    end
  end
end
