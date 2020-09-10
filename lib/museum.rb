class Museum
  attr_reader :name, :exhibits, :patrons

  def initialize(name)
    @name = name
    @exhibits = []
    @patrons = []
  end

  def add_exhibit(exhibit)
    @exhibits << exhibit
  end

  def recommend_exhibits(patron)
    recommendations = []
    @exhibits.each do |exhibit|
      if patron.interests.include?(exhibit.name)
        recommendations << exhibit
      end
    end
    recommendations
  end

  def admit(patron)
    @patrons << patron
  end



  # def patrons_by_exhibit_interest
  #   # @exhibits.each do |exhibit|
  #   # @patrons.each do |patron|
  #     @exhibits.group_by do |exhibit|
  #       @patrons.each do |patron|
  #         recommend_exhibits(patron)
  #       end
  #     end
  # end

  def ticket_lottery_contestants(exhibit)
    list = []
    @patrons.each do |patron|
      if patron.interests.include?(exhibit.name) && patron.spending_money < exhibit.cost
        list << patron
      end
    end
    list
  end
end