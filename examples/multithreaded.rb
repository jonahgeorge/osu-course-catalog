#!/usr/bin/env ruby

# Description: Similar to basic.rb but scrapes each department in its own thread.
# Usage:       ruby mulithreaded.rb > courses_$(date +%Y%m%d).csv

require "osu-cc-scraper"
require "csv"

threads = []
OsuCcScraper::Department.all.each do |department|
  threads << Thread.new do
    department.courses.each do |course|
      course.sections.each do |section|
        $stdout.puts(section.to_a.to_csv)
      end
    end
  end
end
threads.each(&:join)

