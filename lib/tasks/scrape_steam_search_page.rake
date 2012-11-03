require 'open-uri'
desc "Scrape the steam search page to generate games"
task :scrape_steam => [:environment] do
  # class GameListing

  #   @@all = []
  #   @@columns = %w{ price
  #                   type
  #                   metascore
  #                   released
  #                   capsule
  #                   name
  #                 }

  #   @@columns.each do |a|
  #     attr_accessor a.to_sym
  #   end

  #   def self.all
  #     @@all
  #   end

  #   def initialize(*args)
  #     @@columns.each_with_index do |a,i|
  #       send("#{a}=", args[i])
  #     end
  #     @@all << self
  #   end

  # end
  def page_doc(url, page_elements) 
    Nokogiri::HTML(open(url))/page_elements
  end

  def scrape_page(current_page)

    (current_page/".search_result_row").each do |game|
      price = (game/".col.search_price").text.split('$').last
      metascore = (game/".col.search_metascore").text
      released = (game/".col.search_released").text
      name = (game/".col.search_name > h4").text
      # type = (game/".col.search_type > img").map { |image| image['src'] }.first
      # capsule = (game/".col.search_capsule > img").map { |image| image['src'] }.first
      puts name
      Game.create(price: price, metascore: metascore, release_date: released, name: name)
    end
  end
  base_url = "http://store.steampowered.com/search#sort_by=&sort_order=ASC&page="
  Nokogiri::HTML(open(base_url))
# get last search page number
  index_body_text = page_doc("#{base_url}1",".search_pagination_right").inner_text
  last_search_page_number = index_body_text.match(/\d{3}/).to_s
  puts last_search_page_number
# scrape each search page
  for i in 1..1 #last_search_page_number.to_i => this part commented out to prevent excessive test scraping
    current_page = page_doc("#{base_url + i.to_s}","body")
    scrape_page(current_page)
  end

end