require "open-uri"
require "oga"

require "osu-cc-scraper/course"

module OsuCcScraper
  class Department < Struct.new(:name, :subject_code)

    def courses
      html = fetch_courses
      parse_courses(html)
    end

    private

      def fetch_courses
        open("#{ENDPOINT}/CourseList.aspx?subjectcode=#{subject_code}&level=undergrad&campus=corvallis").read
      end

      def parse_courses(html)
        document = Oga.parse_html(html)
        document.xpath("//tr//td//strong/a[last()]").map { |row|
          Course.new(
            parse_course_subject_code(row),
            parse_course_course_number(row),
            parse_course_name(row)
          )
        }
      end

      # NE 311H INTRODUCTION TO THERMAL-FLUID SCIENCES (4)
      def parse_course_subject_code(row)
        row.text.split(' ')[0]
      end

      def parse_course_course_number(row)
        row.text.split(' ')[1]
      end

      def parse_course_name(row)
        row.text.split(' ')[2..-2].join(" ")
      end

  end
end
