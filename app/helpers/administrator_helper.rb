module AdministratorHelper
  def render_flash(items = [])
    html = ""
    items.each do |type, content|
      html << alert_template(type, content)
    end

    html.html_safe
  end

  private

  def alert_template(type, content)
    """
    <div class='alert alert-#{type.to_s} alert-dismissable'>
      <button aria-hidden='true' type='button' data-dismiss='alert' class='close'>&times;</button>
      #{content}
    </div>
    """
  end
end
