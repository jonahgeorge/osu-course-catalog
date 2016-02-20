require 'helper'

describe OsuCcScraper::University do
  it "#departments" do
    html = File.open("./spec/responses/departments.html").read
    university = OsuCcScraper::University.new
    departments = university.send(:parse_departments, html)
    expect(departments.size).to eq(130)
  end

  it "#subject_code" do
    html = File.open("./spec/responses/departments.html").read
    university = OsuCcScraper::University.new
    departments = university.send(:parse_departments, html)
    expect(departments.select { |d| d.name == "Zoology" }.first.subject_code).to eq("Z")
  end

  it "#name" do
    html = File.open("./spec/responses/departments.html").read
    university = OsuCcScraper::University.new
    departments = university.send(:parse_departments, html)
    expect(departments.select { |d| d.subject_code == "Z" }.first.name).to eq("Zoology")
  end
end
