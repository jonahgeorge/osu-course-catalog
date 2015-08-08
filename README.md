# OSU Course Catalog Scraper

A script to gather course data from Oregon State's [Course Catalog](http://catalog.oregonstate.edu/). It makes heavy use of Ruby `threads` and is most performant using a Ruby runtime such as [Rubinius](http://rubini.us/) or [jRuby](http://jruby.org).

> **Warning!** Use of this program may be against Oregon State University's Acceptable Use Policy. Use at your own risk.

## Usage
```shell
bundle install
bundle exec ruby osu-cc-scraper.rb $(date +%Y-%m-%d).csv
```

## Data
[2014-11-16.csv](https://gist.github.com/jonahgeorge/ed765a708e09a3f88ab6)
