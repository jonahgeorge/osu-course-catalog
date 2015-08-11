require "open-uri"
require "nokogiri"

class OsuCcScraper::Section
  # @return [String]
  attr_accessor :department
  # @return [String]
  attr_accessor :number
  # @return [String]
  attr_accessor :name
  # @return [String]
  attr_accessor :term
  # @return [String]
  attr_accessor :section
  # @return [String]
  attr_accessor :instructor
  # @return [String]
  attr_accessor :type
  # @return [String]
  attr_accessor :status
  # @return [String]
  attr_accessor :capacity
  # @return [String]
  attr_accessor :availability

  # @return [OsuCcScraper::Section]
  def initialize(args)
    args.each do |k,v|
      instance_variable_set("@#{k}", v) unless v.nil?
    end
  end

  # @return [Array]
  def to_a
    [@department, @number, @name, @term, @section, @instructor, @type, @status, @capacity, @availability]
  end

  private

  def self.fetch(subject_code, course_number)
    open("#{OsuCcScraper::ENDPOINT}/CourseDetail.aspx?subjectcode=#{subject_code}&coursenumber=#{course_number}").read
  end

  def self.parse(html)
    sections = []

    ng = Nokogiri::HTML(html)
    rows = ng.xpath('//table[@id="ctl00_ContentPlaceHolder1_SOCListUC1_gvOfferings"]/tr[position() > 1]')
    rows.each_with_index do |row, key|
      title = ng.at_xpath('//form/h3').content.split("\n")
      query = "//table[@id='ctl00_ContentPlaceHolder1_SOCListUC1_gvOfferings']"

      sections << OsuCcScraper::Section.new({
        :department   => title[2].delete("\r\n").strip[0..-2].split(" ")[0],
        :number       => title[2].split(" ")[1][0..-2],
        :name         => title[3].strip,
        :term         => at_xpath_or_null(ng, "#{query}/tr[position() = #{key+2}]/td[position() = 1]"),
        :section      => at_xpath_or_null(ng, "#{query}/tr[position() = #{key+2}]/td[position() = 3]"),
        :instructor   => at_xpath_or_null(ng, "#{query}/tr[position() = #{key+2}]/td[position() = 6]"),
        :type         => at_xpath_or_null(ng, "#{query}/tr[position() = #{key+2}]/td[position() = 11]"),
        :status       => at_xpath_or_null(ng, "#{query}/tr[position() = #{key+2}]/td[position() = 12]"),
        :capacity     => at_xpath_or_null(ng, "#{query}/tr[position() = #{key+2}]/td[position() = 13]"),
        :availability => at_xpath_or_null(ng, "#{query}/tr[position() = #{key+2}]/td[position() = 14]")
      })
    end
    sections
  end

  def self.at_xpath_or_null(document, selector)
    if document.at_xpath(selector) != nil
      return document.at_xpath(selector).content.delete("\r\n").strip
    else
      return nil
    end
  end
end
