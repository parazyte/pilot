require 'open-uri'

class Cms::SyncJob
  SERVER = "http://localhost:5000"
  API = "/api/v1/"
  INDEX = 'index.json'

  @queue = :normal

  def self.perform
    self.new.perform
  end

  private

  def perform
    if page = fetch_content(API + INDEX)["page"]
      destroy_all_cms_data
      index = build_index(page)
      index.save!
    end
  end

  def build_index(data)
    index = Cms::Page::Index.new(cms_url: INDEX)
    build_cms_page(index, data)
    index
  end

  def build_item(game)
    url = game["url"]
    item = Cms::Page::Item.new(name: game["name"], cms_url: url)
    if item_page = fetch_content(url)["page"]
      build_cms_page(item, item_page)
    end
    item
  end

  def build_cms_page(page, data)
    build_header(page,  data["header"])
    build_content(page, data["content"])
    build_footer(page,  data["footer"])
  end

  def build_header(page, header)
    page.build_header(text: header["text"], image_path: header["image"]) if header
  end

  def build_content(page, content)
    if content
      page.build_content(main_text: content["main_text"])

      content["games"].try(:each) do |game|
        item = build_item(game)
        page.content.items << item
      end
    end
  end

  def build_footer(page, footer)
    page.build_footer(text: footer["text"]) if footer
  end

  def destroy_all_cms_data
    Cms::Page.destroy_all
  end

  def fetch_content(path)
    JSON.parse(open(SERVER + path).read)
  end
end
