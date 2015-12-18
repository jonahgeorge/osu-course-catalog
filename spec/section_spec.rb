require_relative '../lib/osu-cc-scraper.rb'

describe OsuCcScraper::Section do
  describe '#parse' do
    it 'return the correct number of sections' do
      html = File.open("./spec/responses/sections.html").read
      sections = OsuCcScraper::Section.send(:parse, html)
      expect(sections.size).to eq(8)
    end

    # it "populates the department" do
    #   html = File.open("./spec/responses/sections.html").read
    #   sections = OsuCcScraper::Section.send(:parse, html)
    #   expect(sections[7].department).to eq("Sp16")
    # end

    # it "populates the number" do
    #   html = File.open("./spec/responses/sections.html").read
    #   sections = OsuCcScraper::Section.send(:parse, html)
    #   expect(sections[7].number).to eq("51578")
    # end

    # it "populates the name" do
    #   html = File.open("./spec/responses/sections.html").read
    #   sections = OsuCcScraper::Section.send(:parse, html)
    #   expect(sections[7].name).to eq("400")
    # end

    # it "populates the term" do
    #   html = File.open("./spec/responses/sections.html").read
    #   sections = OsuCcScraper::Section.send(:parse, html)
    #   expect(sections[7].term).to eq("")
    # end
  end

  describe "#to_a" do
    it "returns the correct values" do
      section = OsuCcScraper::Section.new({
        :department   => "ACTG",
        :number       => "317",
        :name         => "EXTERNAL REPORTING I",
        :term         => "F15",
        :section      => "001",
        :instructor   => "Scott, B.",
        :type         => "Lecture",
        :status       => "Waitlisted",
        :capacity     => "30",
        :availability => "30"
      })

      expect(section.to_a).to eq(["ACTG","317","EXTERNAL REPORTING I","F15","001","Scott, B.","Lecture","Waitlisted","30","30"])
    end
  end
end
