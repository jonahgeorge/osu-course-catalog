require 'helper'

describe OsuCcScraper::Department do

  it "return the correct number of courses" do
    html = File.open("./spec/responses/courses.html").read
    courses = OsuCcScraper::Department.new.send(:parse_courses, html)
    expect(courses.size).to eq(37)
  end

  it "populates #subject_code" do
    html = File.open("./spec/responses/courses.html").read
    courses = OsuCcScraper::Department.new.send(:parse_courses, html)
    expect(courses[3].subject_code).to eq("NE")
  end

  it "populates #course_number" do
    html = File.open("./spec/responses/courses.html").read
    courses = OsuCcScraper::Department.new.send(:parse_courses, html)
    expect(courses[3].course_number).to eq("235")
  end

  it "populates #name" do
    html = File.open("./spec/responses/courses.html").read
    courses = OsuCcScraper::Department.new.send(:parse_courses, html)
    expect(courses[3].name).to eq("NUCLEAR AND RADIATION PHYSICS II")
  end

end
