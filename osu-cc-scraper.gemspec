lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'osu-cc-scraper/version'

Gem::Specification.new do |s|
  s.name        = 'osu-cc-scraper'
  s.version     = OsuCcScraper::VERSION
  s.summary     = 'OSU Course Catalog Scraper'
  s.description = 'A script to gather course data from Oregon State University\'s Course Catalog.'
  s.authors     = ['Jonah George']
  s.email       = 'jonah.george@me.com'
  s.files       = [
    'lib/osu-cc-scraper.rb', 'lib/osu-cc-scraper/department.rb', 
    'lib/osu-cc-scraper/course.rb', 'lib/osu-cc-scraper/section.rb', 
    'lib/osu-cc-scraper/university.rb'
  ]
  s.homepage    = 'https://github.com/jonahgeorge/osu-cc-scraper'
  s.license     = 'MIT'

  s.required_ruby_version = '>= 2.3.0'

  s.add_runtime_dependency 'oga', '~> 2.1.0'

  s.add_development_dependency 'rake'
  s.add_development_dependency 'rspec'
end
