require 'helper'

describe OsuCcScraper::Section do
  describe '#parse' do
    it 'return the correct number of sections' do
      html = File.open("./spec/files/sections.html").read
      sections = OsuCcScraper::Section.send(:parse, html)
      expect(sections.size).to eq(8)
    end

    # it "populates the department" do
    #   html = File.open("./spec/files/sections.html").read
    #   sections = OsuCcScraper::Section.send(:parse, html)
    #   expect(sections[7].department).to eq("Sp16")
    # end

    # it "populates the number" do
    #   html = File.open("./spec/files/sections.html").read
    #   sections = OsuCcScraper::Section.send(:parse, html)
    #   expect(sections[7].number).to eq("51578")
    # end

    # it "populates the name" do
    #   html = File.open("./spec/files/sections.html").read
    #   sections = OsuCcScraper::Section.send(:parse, html)
    #   expect(sections[7].name).to eq("400")
    # end

    # it "populates the term" do
    #   html = File.open("./spec/files/sections.html").read
    #   sections = OsuCcScraper::Section.send(:parse, html)
    #   expect(sections[7].term).to eq("")
    # end
  end
end
