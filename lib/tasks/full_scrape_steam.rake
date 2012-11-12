require 'open-uri'
desc "Scrape the steam search page to generate games"
task :scrape_steam => [:environment] do

  def page_doc(url, page_elements) 
    Nokogiri::HTML(open(url))/page_elements
  end

  def scrape_page(current_page)

    (current_page/".search_result_row").each do |row|
      #scrape
      options = parse_page(row)
      type = options[:extra][:extra_type]
      price = options[:price][:ammount]
      steam_id = options[:game][:steam_id]

      game = Game.find_by_steam_id(steam_id)
      if type == "app"
      game = Game.new(options[:buyable].merge(options[:game])) unless game
      game.add_price(price)
      elsif game
      extra = Extra.find_by_game_id(game.id) || game.extras.build(options[:buyable].merge(options[:extra]))
      extra.add_price(price)
      end      
      game.save if game
    end
  end

def parse_page(page)
  price = (page/".search_price").children.last.to_s
  metascore = (page/".search_metascore").inner_text
  released = (page/".search_released").inner_text
  name = (page/".search_name > h4").inner_text
  url = page.attr('href')
  type_img = (page/".search_type img").attr("src").to_s
  type = type_img.match(/_([^_]+)\./).captures.first
  #break things down
  steam_id = url.match(/com\/[^0-9]+\/([0-9]+)\//).captures.first
  type = "demo" if price.match(/Demo/i)
  price = price.gsub(/[^0-9\.]/, '').to_f
  #save things
  {buyable: 
    {name: name,
    release_date: released,
    metascore: metascore,
    url: url,
    },
  price: {ammount: price, 
    start_date: Time.now},
  game:{steam_id: steam_id.to_i},
  extra:{extra_type: type}}
end
  base_url = "http://store.steampowered.com/search/results?sort_order=ASC&snr=1_7_7_230_7&page="
# get last search page number
  index_body_text = page_doc("#{base_url}1",".search_pagination_right").inner_text
  last_search_page_number = index_body_text.match(/\d{3}/).to_s
# scrape each search page

  for i in 1..last_search_page_number.to_i
    puts i
    current_page = page_doc("#{base_url + i.to_s}","body")
    scrape_page(current_page)
    break if i == 3
  end

end