# frozen_string_literal: true

require 'pry'

class Info
  def initialize(browser, driver)
    @browser = browser
    @links = []
    @data = []
    get_links
  end

  def get_links
    @browser.all(:xpath, '//*[contains(@class,"b-tile m-1x1")]/a[@class="b-tile-main"]').each do |row|
      @links.push(row['href'])
    end
  end

  def get_data
    @links.each do |link| 
      @browser.visit link
      name = spec_name?
      image = @browser.find('[class="news-header__image"]')['style']
      text = @browser.find('[class="news-text"]').text.slice(0, 200)
      @data.push(name: name, text: text, image: image)
    end
    @data
  end

  def spec_name?
    if @browser.has_css?('div[class="news-header__title"] > div[class="button-style button-style_special button-style_small button-style_noreflex news-header__button"]')
      name = @browser.find('div[class="news-header__title"] > div[class="button-style button-style_special button-style_small button-style_noreflex news-header__button"]').text
    else
      name = @browser.find('[class="project-navigation__item project-navigation__item_primary project-navigation__item_active"]').text
    end
  end
end
