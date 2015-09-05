module ApplicationHelper
  def icon(name, text=nil)
    "<span class='glyphicon glyphicon-#{name}'></span>".html_safe + (text if text)
  end
end
