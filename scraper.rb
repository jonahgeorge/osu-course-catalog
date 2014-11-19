require 'open-uri'
require 'nokogiri'
require 'ruby-progressbar'
require 'csv'

def fetch_departments()
	puts "Fetching departments..."

	resource = "http://catalog.oregonstate.edu/"
	department_list = Nokogiri::HTML(open("#{resource}CourseDescription.aspx?level=undergrad"))
	departments = department_list.xpath("//tr/td/font/a")
	departments = departments.map{ |d| d.content[/\(.*?\)/][1..-2] }
	return departments
end

def fetch_classes_for_departments(departments)
  puts "Fetching classes..."
  
  p = ProgressBar.create(:format => '%a %B %p%% %t', :starting_at => 0, :total => departments.length)
  
  classes = []
  threads = []
  
	departments.each do |department|
    threads << Thread.new do
    	resource = "http://catalog.oregonstate.edu/"
    	class_list = Nokogiri::HTML(open("#{resource}CourseList.aspx?subjectcode=#{department}&level=undergrad&campus=corvallis"))
    	class_links = class_list.css("tr td strong a:last")
    	classes += class_links.map{ |c| c.attribute('href').value }
      p.increment
    end
    
    threads.each{ |t| t.join }
	end
  
	return classes
end

def at_xpath_or_null(document, selector)
	if document.at_xpath(selector) != nil
		return document.at_xpath(selector).content.delete("\r\n").strip
	else
		return nil
	end
end

def fetch_sections_for_classes(classes)
  puts "Fetching sections..."
  
  p = ProgressBar.create(:format => '%a %B %p%% %t', :starting_at => 0, :total => classes.length)
  
  threads = []
  sections = []

  classes.each do |href|
    threads << Thread.new do
      
      url = "http://catalog.oregonstate.edu/#{href}"
      html = Nokogiri::HTML(open(url))
      
      rows = html.xpath('//table[@id="ctl00_ContentPlaceHolder1_SOCListUC1_gvOfferings"]/tr[position() > 1]')
      rows.each_with_index do |row, key|
        section = {}

        key += 2
        
        title = html.at_xpath('//form/h3').content.split("\n")

        section[:department] = title[2].delete("\r\n").strip[0..-2].split(" ")[0]
        section[:number] = title[2].split(" ")[1][0..-2]
        section[:name] = title[3].strip

        query = "//table[@id='ctl00_ContentPlaceHolder1_SOCListUC1_gvOfferings']"

        section[:term] = at_xpath_or_null(html, "#{query}/tr[position() = #{key}]/td[position() = 1]")
        section[:section] = at_xpath_or_null(html, "#{query}/tr[position() = #{key}]/td[position() = 3]")
        section[:instructor] = at_xpath_or_null(html, "#{query}/tr[position() = #{key}]/td[position() = 6]")
        section[:type] = at_xpath_or_null(html, "#{query}/tr[position() = #{key}]/td[position() = 11]")
        section[:status] = at_xpath_or_null(html, "#{query}/tr[position() = #{key}]/td[position() = 12]")
        section[:capacity] = at_xpath_or_null(html, "#{query}/tr[position() = #{key}]/td[position() = 13]")
        section[:availability] = at_xpath_or_null(html, "#{query}/tr[position() = #{key}]/td[position() = 14]")
        
        sections << section
      end

      p.increment
    end
    
    threads.each{ |t| t.join }
    
  end
  
  return sections
end

def write_sections_to_csv(sections, filename)
  puts "Writing sections to '#{filename}'..."
  
  p = ProgressBar.create(:format => '%a %B %p%% %t', :starting_at => 0, :total => sections.length)
  
  CSV.open(filename, 'w') do |csv|

    csv << [ "Department", "Number", "Name", "Term", "Section", "Instructor", "Type", "Status", "Capacity", "Availability" ]
    
    sections.each do |s|
      csv << [ s[:department], s[:number], s[:name], s[:term], s[:section], s[:instructor], 
               s[:type], s[:status], s[:capacity], s[:availability] ]
      
      csv.flush
      
      p.increment
    end
  end
end

departments = fetch_departments()
classes = fetch_classes_for_departments(departments)
sections = fetch_sections_for_classes(classes)
write_sections_to_csv(sections, ARGV[0])
