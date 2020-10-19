require 'nokogiri'

class Info
  def initialize(driver)
    @source = Nokogiri::HTML(driver.page_source)
    @names = []
    @images = []
    @text = []
  end

  def get_names
    @names = @source.xpath('//*[@class="b-main-page-blocks-header-2 cfix"]').text
  end

  def get_images
    @images = @source.xpath('//i[@class = "b-tile-bg"]/@style').text 
  end

  def get_text
    @text = @source.xpath('//*[@class = "b-tile-header"]').text
  end
end 
