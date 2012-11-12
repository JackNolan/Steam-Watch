module PriceAwareness
  def current_price
    prices.order("start_date DESC").limit(1).first
  end
  def is_lowest?
     current_price.ammount == lowest_price.ammount
  end
  def lowest_price
    prices.order("ammount ASC").limit(1).first
  end
  def add_price(price)
  prices.build(:ammount => price, :start_date => Time.now) if new_price?(price)
  end
  def new_price?(price)
     !current_price || current_price.ammount == price 
  end
end