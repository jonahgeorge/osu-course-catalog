require "open-uri"
require "oga"
require "osu-cc-scraper/section"

module OsuCcScraper
  class Course < Struct.new(:department, :course_number, :name)

    def sections
      html = fetch_sections
      parse_sections(html)
    end

    private

      SECTIONS_XPATH = "//table[@id='ctl00_ContentPlaceHolder1_SOCListUC1_gvOfferings']//tr[position() > 1]"
      TITLE_XPATH = "//form/h3"

      def fetch_sections
        open("#{ENDPOINT}/CourseDetail.aspx?subjectcode=#{department.subject_code}&coursenumber=#{course_number}").read
      end

      def parse_sections(html)
        document = Oga.parse_html(html)

        document.xpath(SECTIONS_XPATH).map { |row|
          Section.new(
            self,
            parse_term(row),
            parse_section(row),
            parse_instructor(row),
            parse_campus(row),
            parse_type(row),
            parse_status(row),
            parse_capacity(row),
            parse_current(row)
          )
        }
      end

      def fetch_column(document, selector)
        document.xpath(selector)&.text&.delete("\r\n")&.strip
      end

      def parse_term(row)
        fetch_column(row, "td[position() = 1]")
      end

      def parse_section(row)
        fetch_column(row, "td[position() = 3]")
      end

      def parse_instructor(row)
        fetch_column(row, "td[position() = 6]")
      end

      def parse_campus(row)
        fetch_column(row, "td[position() = 9]")
      end

      def parse_type(row)
        fetch_column(row, "td[position() = 11]")
      end

      def parse_status(row)
        fetch_column(row, "td[position() = 12]")
      end

      def parse_capacity(row)
        fetch_column(row, "td[position() = 13]")&.to_i
      end

      def parse_current(row)
        fetch_column(row, "td[position() = 14]")&.to_i
      end

  end
end
