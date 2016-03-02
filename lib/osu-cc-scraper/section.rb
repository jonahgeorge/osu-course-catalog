module OsuCcScraper
  class Section < Struct.new(:department, :number, :name, :term, :section,
                             :instructor, :campus, :type, :status, :capacity, :current)
  end
end
