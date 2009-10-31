RAILS_GEM_VERSION = '2.3.4' unless defined? RAILS_GEM_VERSION

require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|

  config.gem "ruby-openid", :lib => "openid"
  config.gem "binarylogic-authlogic", :lib => 'authlogic', :source => 'http://gems.github.com'
  config.gem "authlogic-oid", :lib => "authlogic_openid"
  config.gem 'mislav-will_paginate', :lib => 'will_paginate', :source => "http://gems.github.com"

  config.action_controller.session_store = :active_record_store

  if [ 'test', 'cucumber' ].include?( RAILS_ENV )
    config.gem 'rspec',       :lib => false,        :version => '>=1.2.6'
    config.gem 'rspec-rails', :lib => 'spec/rails', :version => '>=1.2.6'
    config.gem 'cucumber',    :lib => false,        :version => '>=0.4.2'
    config.gem 'selenium-client', :lib => false
    config.gem 'bmabey-database_cleaner', :lib => false
    config.gem 'thoughtbot-factory_girl', :lib => false
  end

  config.i18n.default_locale = :"pt-BR"
  config.time_zone = 'UTC'

end

