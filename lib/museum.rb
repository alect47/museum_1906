class Museum
  attr_reader :name, :exhibits, :patrons

  def initialize(name, exhibits = [], patrons = [])
    @name = name
    @exhibits = exhibits
    @patrons = patrons
  end

  def add_exhibit(exhi)
    @exhibits << exhi
  end

  # def recommend_exhibits(patron)
  #   patron.interests.map do |int|
  #     int.map
  #     @exhibits.select do |ex|
  #       int == ex.name
  #     end
  #   end
  #   @exhibits
  # end

  def recommend_exhibits(patron)
    patron.interests.map do |int|
      #Whenever we want a certain type of object our of a method
      #that should be in the first line of the code after the
      #def method
      @exhibits.select do |ex|
       int == ex.name
      end
    end.flatten
  end

  def admit(patron)
    @patrons << patron
  end

  def patrons_by_exhibit_interest
    hash_1 = {}
    @exhibits.each do |exhi|
      hash_1[exhi] = []
    end
    @patrons.each do |patron|
      hash_1.each do |k, v|
        if patron.interests.include?(k.name)
          v << patron
        end
      end
    end
    hash_1
  end


end
