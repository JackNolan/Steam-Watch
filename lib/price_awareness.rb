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
end