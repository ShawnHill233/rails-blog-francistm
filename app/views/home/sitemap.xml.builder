xml.instruct!
xml.urlset xmlns: "http://www.sitemaps.org/schemas/sitemap/0.9" do
@entry.find_each do |entry|
  xml.url do
    xml.loc entry_path entry, only_path: false
    xml.lastmod entry.updated_at.strftime "%Y-%m-%d"
    xml.changefreq "weekly"
    xml.priority 0.8
  end
end
end
