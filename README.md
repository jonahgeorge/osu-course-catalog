## OSU Course Catalog Scraper

[![Join the chat at https://gitter.im/jonahgeorge/osu-cc-scraper](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/jonahgeorge/osu-cc-scraper?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)
[![Gem Version](https://badge.fury.io/rb/osu-cc-scraper.svg)](http://badge.fury.io/rb/osu-cc-scraper)
[![Build Status](https://travis-ci.org/jonahgeorge/osu-course-catalog.svg?branch=master)](https://travis-ci.org/jonahgeorge/osu-course-catalog)
[![Inline docs](https://img.shields.io/badge/docs-rubydoc-blue.svg)](http://www.rubydoc.info/gems/osu-cc-scraper/)

A script to gather course data from Oregon State University's [Course Catalog](http://catalog.oregonstate.edu/).

> **Warning!** Use of this gem may be against Oregon State University's Acceptable Use Policy.

#### Example
```ruby
# Description: Prints course data to stdout in csv format.
# Usage:       ruby examples/basic.rb > courses_$(date +%Y%m%d).csv

require "osu-cc-scraper"
require "csv"

puts %w(Department Number Name Term CRN Section Instructor
        Campus Type Status Capacity Current).to_csv

university = OsuCcScraper::University.new

university.departments.each do |department|
  department.courses.each do |course|
    course.sections.each do |section|
      puts section.to_a.to_csv
    end
  end
end
```
