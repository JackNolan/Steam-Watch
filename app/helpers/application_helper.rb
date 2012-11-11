module ApplicationHelper
  def show_price_history(prices)
    prices.inject("") do |html,price|
      html + "<li>$#{price.ammount.to_s} on #{price.start_date.to_s}</li>"
    end
  end
end
