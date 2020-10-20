require 'nokogiri'

class Info
  def initialize(driver)
    @source = Nokogiri::HTML(driver.page_source)
    @data = []
  end

  def get_data
    @source.xpath('//*[contains(@class,"b-tile m-1x1 m-info")]').each do |row|
      name = row.css('[class="b-tile-section"]').text
      text = row.css('[class="txt max-lines-4"]').text
      image = row.css('[class="b-tile-bg"]').first['style']
      @data.push(name: name, text: text, image: image)
    end
    @data
  end

  def get_text
    @text = @source.xpath('//*[@class = "b-tile-header"]').text
  end
end 
