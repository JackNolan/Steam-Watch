require 'open-uri'
desc "Scrape the steam search page to generate games"
task :scrape_steam => [:environment] do

  def page_doc(url, page_elements) 
    Nokogiri::HTML(open(url))/page_elements
  end

  def scrape_page(current_page)

    (current_page/".search_result_row").each do |game|
    #scrape
    price = (game/".search_price").children.last.to_s
    metascore = (game/".search_metascore").inner_text
    released = (game/".search_released").inner_text
    name = (game/".search_name > h4").inner_text
    url = game.attr('href')
    #break things down
    type,steam_id = url.match(/store.steampowered.com\/([\s\S]+?)\/([\s\S]+?)\//).captures
  
    type = "demo" if price.match(/Demo/i)
    price = price.gsub(/[^0-9\.]/, '').to_f
    #save things
    if type == "app"
      if game = Game.find_by_steam_id(steam_id.to_i)
        game.prices.build(:ammount => price, :start_date => Time.now) unless game.current_price.ammount == price 
      else
        game = Game.new(    name: name,
                            release_date: released,
                            metascore: metascore,
                            url: url,
                            steam_id: steam_id
                            )
        game.prices.build(ammount: price, start_date: Time.now)
      end
        game.save
    end
    
    end

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