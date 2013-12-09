module ApplicationHelper
  def render_list(items=[], html = {})
    html = "<ul>"
    yield items if block_given?

    items.each do |item|
      unless current_link?(item)
        html << "<li>"
      else
        html << "<li class='active'>"
      end

      html << item << "</li>" << "\n"
    end

    html << "</ul>"
    html.html_safe
  end

  private

  def current_link?(link)
    href = link.match(/href=(['"])(.*?)(\1)/)[2] rescue all
    href and current_page?(href)
  end

end
