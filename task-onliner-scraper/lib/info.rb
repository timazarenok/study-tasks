
class Info
  def initialize(driver)
    @source = driver.page_source
    @names = []
    @images = []
    @text = []
  end

  def get_names
    p @source.xpath('//*[@class = "b-tile-section"]')
  end

  def get_images
  end

  def get_text
  end
end