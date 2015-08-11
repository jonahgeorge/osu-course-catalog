require "open-uri"
require "nokogiri"
require "osu-cc-scraper/course"

class OsuCcScraper::Department
  attr_accessor :subject_code

  def initialize(args)
    args.each do |k,v|
      instance_variable_set("@#{k}", v) unless v.nil?
    end
  end

  def self.all
    html = OsuCcScraper::Department::fetch
    OsuCcScraper::Department::parse(html)
  end

  def courses
    html = OsuCcScraper::Course::fetch(self.subject_code)
    OsuCcScraper::Course::parse(html)
  end

  private

  def self.fetch
    open("#{OsuCcScraper::ENDPOINT}/CourseDescription.aspx?level=undergrad").read
  end

  def self.parse(html)
    ng = Nokogiri::HTML(html)
    ng.xpath("//tr/td/font/a").map{ |department|
      OsuCcScraper::Department.new({
        subject_code: department.content[/\(.*?\)/][1..-2]
      })
    }.sort { |a,b|
      a.subject_code.downcase <=> b.subject_code.downcase
    }
  end
end
