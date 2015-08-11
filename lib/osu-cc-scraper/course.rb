require "open-uri"
require "nokogiri"
require "osu-cc-scraper/section"

class OsuCcScraper::Course
  # @return [String]
  attr_accessor :subject_code
  # @return [String]
  attr_accessor :course_number

  # @return [OsuCcScraper::Course]
  def initialize(args)
    args.each do |k,v|
      instance_variable_set("@#{k}", v) unless v.nil?
    end
  end

  # @return [Array<OsuCcScraper::Section>]
  def sections
    html = OsuCcScraper::Section::fetch(self.subject_code, self.course_number)
    OsuCcScraper::Section::parse(html)
  end

  private

  def self.fetch(subject_code)
    open("#{OsuCcScraper::ENDPOINT}/CourseList.aspx?subjectcode=#{subject_code}&level=undergrad&campus=corvallis").read
  end

  def self.parse(html)
    ng = Nokogiri::HTML(html)
    ng.css("tr td strong a:last").map{ |course|
      uri = course.attribute('href').to_s.gsub('CourseDetail.aspx?', '')
      params = URI.decode_www_form(uri).to_h
      OsuCcScraper::Course.new({
        subject_code: params["subjectcode"],
        course_number: params["coursenumber"]
      })
    }
  end
end
