module ApplicationHelper

  def lang_menu(this_page)
    ['ru','en'].each do |lang|
      concat link_to(lang, "#{this_page.gsub(/(\?|\/|\&)lang=\w*(\&|$)/,'')}?lang=#{lang}") + " "
    end
  end
end
