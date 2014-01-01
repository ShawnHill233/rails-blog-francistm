xml.instruct! :xml, :version => "1.0" 
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "Francis' Blog"
    xml.description "About my life and coding"
    xml.link root_path only_path: false

    @entries.each do |entry|
      xml.item do
        xml.title entry.title
        xml.description {
            xml.cdata! entry.to_html.html_safe
        }
        xml.pubDate entry.created_at.to_s :rfc822
        xml.guid entry_path entry, only_path: false
        xml.link entry_path entry, only_path: false
      end
    end
  end
end
