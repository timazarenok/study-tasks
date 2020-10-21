require 'nokogiri'
require 'pry'

class Info
  def initialize(browser, driver)
    @browser = browser
    @source = Nokogiri::HTML(driver.page_source)
    @data = []
  end

  def get_data
    @source.xpath('//*[contains(@class,"b-tile m-1x1 m-info")]').each do |row|
      name = row.css('[class*="b-tile-section"]').text
      image = row.css('[class="b-tile-bg"]').first['style']
      id = get_id(row)
      text = get_text(id)
      
      @browser.go_back
      @data.push(name: name, text: text, image: image)
    end
    @data
  end

  def get_id(row)
    row.find('[class="b-tile-main" href*=""]').first[1]
  end

  def get_text(id)
    @browser.find('div[id='"#{id}"'] > a[class="b-tile-main').click
    @browser.find('[class="news-text"]').text.slice(0, 200)
  end
end 
