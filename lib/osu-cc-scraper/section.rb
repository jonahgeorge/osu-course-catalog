module OsuCcScraper
  class Section < Struct.new(:department, :number, :name, :term, :section, 
                             :instructor, :type, :status, :capacity, :current)
  end
end
