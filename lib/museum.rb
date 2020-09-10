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



  def patrons_by_exhibit_interest
    @exhibits.group_by |patron|
    
  end

  def ticket_lottery_contestants(exhibit)
    list = []
    @patrons.each do |patron|
      if patron.interests.include?(exhibit.name) && patron.spending_money < exhibit.cost
        list << patron
      end
    end
    list
  end

  def draw_lottery_winner(exhibit)
    @lotto_result = ticket_lottery_contestants(exhibit).sample.name
    @lotto_result
  end

  def announce_lottery_winner(exhibit)
    if ticket_lottery_contestants(exhibit) != []
      p "#{@lotto_result} has won the #{exhibit.name} exhibit lottery"
    else
      p "No winners for this lottery"
    end
  end
end