RAILS_GEM_VERSION = '2.3.4' unless defined? RAILS_GEM_VERSION

require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|

  config.gem "ruby-openid", :lib => "openid"
  config.gem 'paperclip', :version => '=2.1.2'
  config.gem "binarylogic-authlogic", :lib => 'authlogic', :source => 'http://gems.github.com'
  config.gem "authlogic-oid", :lib => "authlogic_openid"
  config.gem 'mislav-will_paginate', :lib => 'will_paginate', :source => "http://gems.github.com"
  config.gem 'nokogiri'

  config.action_controller.session_store = :active_record_store

  if [ 'test', 'cucumber' ].include?( RAILS_ENV )

    config.gem 'cucumber-rails',   :lib => false, :version => '>=0.2.4' unless File.directory?(File.join(Rails.root, 'vendor/plugins/cucumber-rails'))
    config.gem 'database_cleaner', :lib => false, :version => '>=0.4.3' unless File.directory?(File.join(Rails.root, 'vendor/plugins/database_cleaner'))
    config.gem 'webrat',           :lib => false, :version => '>=0.6.0' unless File.directory?(File.join(Rails.root, 'vendor/plugins/webrat'))
    config.gem 'rspec',            :lib => false, :version => '>=1.3.0' unless File.directory?(File.join(Rails.root, 'vendor/plugins/rspec'))
    config.gem 'rspec-rails',      :lib => false, :version => '>=1.3.2' unless File.directory?(File.join(Rails.root, 'vendor/plugins/rspec-rails'))
    config.gem 'selenium-client',  :lib => false, :version => '>=1.2.17'
    config.gem 'factory_girl',     :source => 'http://gemcutter.org'

    config.gem "relevance-rcov",  :lib => false
    config.gem "reek",  :lib => false
    config.gem "ruby-debug",  :lib => false
    #config.gem 'cucumber',    :lib => false,        :version => '=0.6.4'
    #config.gem 'webrat',      :lib => false,        :version => '>=0.4.4'
    #config.gem 'rspec',       :lib => false,        :version => '>=1.2.6'
    #config.gem 'rspec-rails', :lib => 'spec/rails', :version => '>=1.2.6'
    #config.gem 'selenium-client', :lib => false
    #config.gem 'bmabey-database_cleaner', :lib => false
    config.gem 'remarkable_rails', :lib => false
    #config.gem 'thoughtbot-factory_girl', :lib => false
    config.gem "lawrencepit-remarkable_paperclip", :lib => false, :source => "http://gems.github.com"
    config.gem "giraffesoft-resource_controller", :lib => "resource_controller",  :version => ">= 0.6.1", :source => "git://github.com/giraffesoft/resource_controller.git"
  end

  config.i18n.default_locale = :"pt-BR"
  config.time_zone = 'UTC'

end

ActionView::Base.field_error_proc = Proc.new { |html_tag, instance| "#{html_tag}" }

