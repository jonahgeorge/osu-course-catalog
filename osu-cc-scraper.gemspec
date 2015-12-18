lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require_relative 'lib/osu-cc-scraper.rb'

Gem::Specification.new do |spec|
  spec.name        = 'osu-cc-scraper'
  spec.version     = OsuCcScraper::VERSION
  spec.summary     = 'OSU Course Catalog Scraper'
  spec.description = 'A script to gather course data from Oregon State\'s Course Catalog.'
  spec.authors     = ['Jonah George']
  spec.email       = 'jonah.george@me.com'
  spec.homepage    = 'https://github.com/jonahgeorge/osu-cc-scraper'
  spec.license     = 'MIT'

  spec.files         = `git ls-files`.split($INPUT_RECORD_SEPARATOR)
  spec.require_paths = ["lib"]

  spec.add_dependency 'nokogiri', '1.6.6.2'

  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
