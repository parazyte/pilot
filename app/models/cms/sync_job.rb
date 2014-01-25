require 'open-uri'

class Cms::SyncJob
  SERVER = "http://localhost:5000"
  API = "/api/v1/"
  INDEX = 'index.json'

  @queue = :normal

  def self.perform
    self.new.perform
  end

  def perform
    if page = fetch_content(API + INDEX)["page"]
      index = build_or_update_index(page)
      index.save!
    end
  end

  private

  def build_or_update_index(data)
    index = Cms::Page::Index.first_or_initialize(cms_url: INDEX)
    build_cms_page(index, data)
    index
  end

  def build_cms_page(page, data)
    process_header(page,  data["header"])  if data["header"]
    process_content(page, data["content"]) if data["content"]
    process_footer(page,  data["footer"])  if data["footer"]
  end

  def process_header(page, header)
    attributes = { text: header["text"], image_path: header["image"] }
    page.header ? page.header.update_attributes(attributes) : page.build_header(attributes)
  end

  def process_content(page, content)
    games = content["games"]
    attributes = { main_text: content["main_text"] }
    page.content ? page.content.update_attributes(attributes) : page.build_content(attributes)

    games.try(:each) do |game|
      item = build_or_update_item(game)
      page.content.items << item
    end
  end

  def build_or_update_item(game)
    url = game["url"]

    item = if (existing = Cms::Page::Item.find_by_cms_url(url))
      existing.update_attributes(name: game["name"])
      existing
    else
      Cms::Page::Item.new(name: game["name"], cms_url: url)
    end

    if page = fetch_content(url)["page"]
      build_cms_page(item, page)
    end

    item
  end

  def process_footer(page, footer)
    attributes = { text: footer["text"] }
    page.footer ? page.footer.update_attributes(attributes) : page.build_footer(attributes)
  end

  def fetch_content(path)
    JSON.parse(open(SERVER + path).read)
  end
end
