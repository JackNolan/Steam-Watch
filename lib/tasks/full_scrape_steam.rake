require 'open-uri'
desc "Scrape the steam search page to generate games"
task :scrape_steam => [:environment] do

  def page_doc(url, page_elements) 
    Nokogiri::HTML(open(url))/page_elements
  end

  def scrape_page(current_page)

    (current_page/".search_result_row").each do |game|
    price = (game/".search_price").children.last.to_s.gsub(/[^0-9\.]/, '').to_f
    metascore = (game/".search_metascore").inner_text
    released = (game/".search_released").inner_text
    name = (game/".search_name > h4").inner_text
    type_img = (game/".search_type img").attr("src").to_s
    type = type_img.match(/_([^_]+)\./)
    obj = type.match(/app/) ? Game.new : Extra.new()
    debugger if  obj.is_a? Extra

    obj.name = name
    obj.release_date = released
    obj.prices.build(:ammount => price, :start_date => 0.days.ago)
    obj.metascore = metascore

    obj.save
    puts obj.extra_type if obj.is_a? Extra

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