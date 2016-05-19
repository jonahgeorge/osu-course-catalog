module OsuCcScraper
  class Section < Struct.new(:subject_code, :course_number, :name, :term, :crn,
                             :section, :instructor, :campus, :type, :status,
                             :capacity, :current)
  end
end
