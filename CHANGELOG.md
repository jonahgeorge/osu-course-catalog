# Change Log
All notable changes to this project will be documented in this file.
This project adheres to [Semantic Versioning](http://semver.org/).

## [5.0.0] - 2016-05-19
- Added `crn` field to `Section`

## [4.0.0] - 2016-03-02
This release pretty much reverses most of the Struct "re-structuring" of 3.0.0 🙈
Turns out there's a much easier way to get access to Graduate level courses by just dropping a GET param.
- Added `to_json` and `from_json` on `Department`
- Added `to_json` and `from_json` on `Course`

## [3.0.0] - 2016-03-02
- `University#fetch_departments` is now private
- `University#parse_departments` is now private
- `University#parse_department_subject_code` is now private
- `University#parse_department_name` is now private
- `Section` has a new `campus` field
  - This modifies the constructor
- `University` has a new `level` field
  - This modifies the constructor
  - This allows the scraper to find Undergraduate or Graduate level courses

## [2.0.0] - 2016-02-19
- Switched from Nokogiri to Oga from HTML parsing
- Added `University` class and `#departments` method to replace `Department#all`
- Removed `Department#all`
- All classes now inherit from `Struct` so that we automatically get `#to_a`
- Renamed `Section#availability` to `Section#current`
- Removed multithreaded example
- `Section#capacity` now returns an integer (rather than string)
- `Section#current` now returns an integer (rather than string)
