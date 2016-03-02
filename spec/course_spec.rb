require 'helper'

describe OsuCcScraper::Course do
  it '#sections' do
    html = File.open("./spec/responses/sections.html").read
    sections = OsuCcScraper::Course.new.send(:parse_sections, html)
    expect(sections.size).to eq(8)
  end

  # it "populates the department" do
  #   html = File.open("./spec/responses/sections.html").read
  #   university = OsuCcScraper::University.new("Undergrad")
  #   department = OsuCcScraper::Department.new(university, "ST", nil)
  #   sections = OsuCcScraper::Course.new.send(:parse_sections, html)
  #   expect(sections[7].department).to eq("ST")
  # end
  #
  # it "populates the number" do
  #   html = File.open("./spec/responses/sections.html").read
  #   sections = OsuCcScraper::Course.new.send(:parse_sections, html)
  #   expect(sections[7].number).to eq("202")
  # end
  #
  # it "populates the name" do
  #   html = File.open("./spec/responses/sections.html").read
  #   sections = OsuCcScraper::Course.new.send(:parse_sections, html)
  #   expect(sections[7].name).to eq("PRINCIPLES OF STATISTICS")
  # end

  it "populates the term" do
    html = File.open("./spec/responses/sections.html").read
    sections = OsuCcScraper::Course.new.send(:parse_sections, html)
    expect(sections[7].term).to eq("Sp16")
  end
end
