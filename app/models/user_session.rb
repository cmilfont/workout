class UserSession < Authlogic::Session::Base
  logout_on_timeout false
  consecutive_failed_logins_limit 3
  failed_login_ban_for 0 #permanent ban | Default: 2.hours
end

