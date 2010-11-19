module ApplicationHelper

  def lang_menu(this_page)
    ['ru','en'].each do |lang|
      concat content_tag :span, link_to(lang, "#{this_page.gsub(/(\?|\/|\&)lang=\w*(\&|$)/,'')}?lang=#{lang}") 
    end
  end

  def login_url
    if authenticated?
      concat link_to(t('auth.logout'), user_sessions_path, :method => :delete)
    else
      concat link_to(t('auth.login'), new_user_sessions_path)
    end
  end
end
