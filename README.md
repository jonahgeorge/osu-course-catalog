# OSU Course Catalog Scraper

Simple script to gather class data from Oregon State's [course catalog](http://catalog.oregonstate.edu/). This script makes heavy use of Ruby `threads` and is most performant using a Ruby runtime such as [Rubinius](http://rubini.us/). 

**Warning!** Use of this script may be against Oregon State University's Acceptable Use Policy. Use at your own risk.

## Usage
```shell
bundle install
bundle exec scraper.rb <filename>
```

## License
>Copyright (c) 2014 Jonah George

>MIT License

>Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

>The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

>THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
