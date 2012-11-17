module PriceAwareness
  def is_lowest?
     current_price.ammount == lowest_price.ammount
  end
  def lowest_price
    prices.order("ammount ASC").limit(1).first
  end
  def add_price(price)
    if new_price?(price)
      prices.build(:ammount => price, :start_date => Time.now)  
      self.current_price = price
    end
  end
  def new_price?(price)
    debugger
     !current_price || !(current_price == price) 
  end
  def price
    current_price.to_f / 100
  end
end