class Museum
  attr_reader :name, :exhibits

  def initialize(name, exhibits = [])
    @name = name
    @exhibits = exhibits
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
    # @exhibits
  end


end
