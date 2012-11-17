require 'open-uri'
desc "Scrape the steam search page to generate games"
task :scrape_steam => [:environment] do
  $numSuss = 0
  $numfail = 0
  def page_doc(url, page_elements)
    try_again(0,3){Nokogiri::HTML(open(url))/page_elements}
  end

  def try_again(i,n)
    begin
      yield
    rescue Exception => e
      puts "#{e} attempt number #{i}"
      sleep(25)
      i += 1
      try_again(i,n) unless i == n
    end
  end

  def scrape_page(current_page)

    (current_page/".search_result_row").each do |row|
      #scrape
      options = parse_page(row)
      type = options[:extra][:extra_type]
      price = options[:price][:ammount]
      name = options[:buyable][:name]

      game = Game.find_by_name(name)
      if type == "app"
      game = Game.new(options[:buyable].merge(options[:game])) unless game
      game.add_price(price)
      game.save 
      else
      extra = Extra.find_by_name(name) || Extra.new(options[:buyable].merge(options[:extra]))
      extra.game = extra.find_game_belongs_to
      extra.add_price(price)
      extra.save if extra.game
      end
    end
  end

def parse_page(page)
  price = (page/".search_price").children.last.to_s
  metascore = (page/".search_metascore").inner_text
  released = (page/".search_released").inner_text
  name = (page/".search_name > h4").inner_text.gsub(/[^ -~]/i,"")
  url = page.attr('href')
  type_img = (page/".search_type img").attr("src").to_s
  type = type_img.match(/_([^_]+)\./).captures.first
  #break things down
  steam_id = url.match(/com\/[^0-9]+\/([0-9]+)\//).captures.first
  type = "demo" if price.match(/Demo/i)
  price = price.gsub(/[^0-9]/, '').to_i
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
  index_body_text = page_doc("#{base_url}1",".search_pagination_right").inner_text
  last_search_page_number = index_body_text.match(/\d{3}/).to_s
  puts last_search_page_number

  for i in 1..last_search_page_number.to_i
    puts base_url + i.to_s
    current_page = page_doc("#{base_url + i.to_s}","body")    
    scrape_page(current_page)
  end
  puts $numSuss
  puts $numfail
end