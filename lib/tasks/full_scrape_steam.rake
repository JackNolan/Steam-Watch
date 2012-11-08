require 'open-uri'
desc "Scrape the steam search page to generate games"
task :scrape_steam => [:environment] do

  def page_doc(url, page_elements) 
    Nokogiri::HTML(open(url))/page_elements
  end

  def scrape_page(current_page)

    (current_page/".search_result_row").each do |game|
      price = (game/".search_price").children.last.text.gsub(/[^0-9\.]/, '').to_f
      metascore = (game/".search_metascore").text
      released = (game/".search_released").text
      name = (game/".search_name > h4").text
      type = (game/".search_type img").attr("src").to_s

      # capsule = (game/".search_capsule > img").map { |image| image['src'] }.first
      price_obj = Price.new(:ammount => price)
      # content = type.include? "game" : Game.new ? AdditionalContent.new
      content.price = price_obj
      content.release_date = released
      content.name = name
      # create price object
      # 
      
      
      Game.create(metascore: metascore, release_date: released, name: name)
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
    break
  end

end