module ApplicationHelper

  def lang_menu(this_page)

    if root_url.match(this_page)
      this_page = root_url
    end

    ['uk', 'en', 'ru'].each do |lang|
      this_page.gsub!(/\/[a-z]{2}(\/|$)/, "/#{lang}/")
      concat content_tag :span, link_to(lang, "#{this_page}")
    end
  end

  def login_url
    if authenticated?
      concat link_to(t('auth.logout'), user_sessions_path, :method => :delete)
    else
      concat link_to(t('auth.login'), new_user_sessions_path, :remote => true)
    end
  end
end
