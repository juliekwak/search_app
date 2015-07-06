module Scraper



  def self.create_page
    page = connect.get('http://www.sproutedkitchen.com/recipes/')
    base_url = 'http://www.sproutedkitchen.com'
    urls = get_recipe_url_list(page, base_url)
    get_recipe_from_url(urls)

  end




  def self.connect
    Mechanize.new
  end

  def self.get_recipe_url_list(page, base_url)
    recipe_urls = []
    page.links.each do |link|
      href = link.href
      if href[6..9].to_i > 1
        recipe_url = base_url + href
        recipe_urls.push(recipe_url)
      end
    end
    return recipe_urls
  end

  def self.get_recipe_from_url(recipes_urls)
    recipes_urls.each do |recipe_url|
      body = find_body(recipe_url)
      title = find_title(recipe_url)
      images = find_images(recipe_url)
      page = Page.create(title: title, url: recipe_url, body: body, image: images)
    end
  end

  def self.find_body(recipe_url)
    connect.get(recipe_url).search("div.journal-entry-text div.body").text
  end

  def self.find_title(recipe_url)
    connect.get(recipe_url).search("a.journal-entry-navigation-current").children.text
  end

  def self.find_images(recipe_url)
    images = []
    sourced_images = connect.get(recipe_url).search("div.journal-entry-text img")
    sourced_images.each do |image|
      images.push(image["src"])
    end
    return images
  end










end
