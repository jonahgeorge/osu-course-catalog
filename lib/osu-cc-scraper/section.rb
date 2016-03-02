module OsuCcScraper
  class Section < Struct.new(:course, :term, :section, :instructor, :campus,
                             :type, :status, :capacity, :current)
    def to_a
      [ course.department.subject_code, course.course_number, course.name,
        term, section, instructor, campus, type, status, capacity, current ]
    end

  end
end
