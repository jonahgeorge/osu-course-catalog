require 'helper'

describe OsuCcScraper::Course do
  describe '#parse' do
    it "return the correct number of courses" do
      html = File.open("./spec/responses/courses.html").read
      courses = OsuCcScraper::Course.send(:parse, html)
      expect(courses.size).to eq(37)
    end

    it "populates the subject_code" do
      html = File.open("./spec/responses/courses.html").read
      courses = OsuCcScraper::Course.send(:parse, html)
      expect(courses[3].subject_code).to eq("NE")
    end

    it "populates the course_number" do
      html = File.open("./spec/responses/courses.html").read
      courses = OsuCcScraper::Course.send(:parse, html)
      expect(courses[3].course_number).to eq("235")
    end
  end
end
