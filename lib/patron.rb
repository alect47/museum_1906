class Patron
  attr_reader :name, :spending_money, :interests

  def initialize(name, spending_money, interests = [])
    @name = name
    @spending_money = spending_money
    @interests = interests
  end

  def add_interest(interest)
    @interests << interest
  end

end
