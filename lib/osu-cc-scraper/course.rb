require "open-uri"
require "oga"

require "osu-cc-scraper/section"

module OsuCcScraper
  class Course < Struct.new(:subject_code, :course_number, :name)

    def sections
      html = fetch_sections
      parse_sections(html)
    end

    private

      SECTIONS_XPATH = "//table[@id='ctl00_ContentPlaceHolder1_SOCListUC1_gvOfferings']//tr[position() > 1]"
      TITLE_XPATH = "//form/h3"

      def fetch_sections
        open("#{ENDPOINT}/CourseDetail.aspx?subjectcode=#{subject_code}&coursenumber=#{course_number}").read
      end

      def parse_sections(html)
        document = Oga.parse_html(html)

        document.xpath(SECTIONS_XPATH).map { |row| 
          Section.new(
            parse_department(document), 
            parse_number(document), 
            parse_name(document), 
            parse_term(row), 
            parse_section(row),
            parse_instructor(row), 
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

      def parse_department(document)
        title = document.xpath(TITLE_XPATH).text.split("\n")
        title[2].delete("\r\n").strip[0..-2].split(" ")[0]
      end

      def parse_number(document)
        title = document.xpath(TITLE_XPATH).text.split("\n")
        title[2].split(" ")[1][0..-2]
      end

      def parse_name(document)
        title = document.xpath(TITLE_XPATH).text.split("\n")
        title[3].strip
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
