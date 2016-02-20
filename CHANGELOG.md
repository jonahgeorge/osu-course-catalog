# Change Log
All notable changes to this project will be documented in this file.
This project adheres to [Semantic Versioning](http://semver.org/).

## [2.0.0] - 2016-02-19
- Switched from Nokogiri to Oga from HTML parsing
- Added `University` class and `#departments` method to replace `Department#all`
- Removed `Department#all`
- All classes now inherit from `Struct` so that we automatically get `#to_a`
- Renamed `Section#availability` to `Section#current`
- Removed multithreaded example
- `Section#capacity` now returns an integer (rather than string)
- `Section#current` now returns an integer (rather than string)
