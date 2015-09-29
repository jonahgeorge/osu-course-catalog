## OSU Course Catalog Scraper
[![Gem Version](https://badge.fury.io/rb/osu-cc-scraper.svg)](http://badge.fury.io/rb/osu-cc-scraper)
[![Build Status](https://travis-ci.org/jonahgeorge/osu-cc-scraper.svg?branch=master)](https://travis-ci.org/jonahgeorge/osu-cc-scraper)
[![Inline docs](https://img.shields.io/badge/docs-rubydoc-blue.svg)](https://img.shields.io/badge/docs-rubydoc-blue.svg)

A script to gather course data from Oregon State University's [Course Catalog](http://catalog.oregonstate.edu/).

> **Warning!** Use of this gem may be against Oregon State University's Acceptable Use Policy. Use at your own risk.

#### Example
```ruby
#!/usr/bin/env ruby

# Description: Prints course data to stdout in csv format.
# Usage:       ruby example.rb > courses_$(date +%Y%m%d).csv

require "osu-cc-scraper"
require "csv"

OsuCcScraper::Department.all.each do |department|
  department.courses.each do |course|
    course.sections.each do |section|
      $stdout.puts(section.to_a.to_csv)
    end
  end
end
```
[More examples](https://github.com/jonahgeorge/osu-cc-scraper/tree/master/examples)

#### Data
[2014-11-16.csv](https://gist.github.com/jonahgeorge/ed765a708e09a3f88ab6)
