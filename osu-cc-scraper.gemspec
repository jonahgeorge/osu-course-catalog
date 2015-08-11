Gem::Specification.new do |s|
  s.name        = 'osu-cc-scraper'
  s.version     = '1.0.1'
  s.date        = '2015-08-10'
  s.summary     = 'OSU Course Catalog Scraper'
  s.description = 'A script to gather course data from Oregon State\'s Course Catalog.'
  s.authors     = ['Jonah George']
  s.email       = 'jonah.george@me.com'
  s.files       = ['lib/osu-cc-scraper.rb', 'lib/osu-cc-scraper/department.rb', 'lib/osu-cc-scraper/course.rb', 'lib/osu-cc-scraper/section.rb']
  s.homepage    = 'https://github.com/jonahgeorge/osu-cc-scraper'
  s.license     = 'MIT'
  s.executables << 'osu-cc-scraper'
  s.add_dependency 'nokogiri', '1.6.6.2'
end
