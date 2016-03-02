require "open-uri"
require "oga"
require "osu-cc-scraper/department"

module OsuCcScraper
  class University < Struct.new(:level)

    def departments
      html = fetch_departments
      parse_departments(html)
    end

    private

      def fetch_departments
        open("#{ENDPOINT}/CourseDescription.aspx?level=#{level}").read
      end

      def parse_departments(html)
        ng = Oga.parse_html(html)
        ng.xpath("//tr/td/font/a").map { |row|
          Department.new(
            self,
            parse_department_name(row),
            parse_department_subject_code(row),
          )
        }
      end

      def parse_department_subject_code(row)
        row.text[/\(.*?\)/][1..-2]
      end

      def parse_department_name(row)
        row.text[/([^(]+)/].strip
      end

  end
end
