//= require markdown.min
//= require_self

;(function($) {

  $.fn.toMarkdown = function(args) {

    var args = $.extend({
      "markdown_wrap" : ""
    }, args);

    markdown_wrap = $(args.markdown_wrap)
    markdown_wrap.hide();

    raw_markdown = markdown_wrap.val();
    parsed_html = markdown.toHTML(raw_markdown);

    this.html(parsed_html);
  };

})(jQuery);
