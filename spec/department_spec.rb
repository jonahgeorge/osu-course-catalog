require_relative "../lib/osu-cc-scraper.rb"

describe OsuCcScraper::Department do
  context '#parse' do
    it "should return the correct number of departments" do
      html = File.open("./spec/responses/departments.html").read
      departments = OsuCcScraper::Department.send(:parse, html)
      expect(departments.size).to eq(130)
    end

    it "populates the subject_code" do
      html = File.open("./spec/responses/departments.html").read
      departments = OsuCcScraper::Department.send(:parse, html)
      expect(departments[129].subject_code).to eq("Z")
    end
  end
end
