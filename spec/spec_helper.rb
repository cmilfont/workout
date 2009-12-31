ENV["RAILS_ENV"] ||= 'test'
require File.dirname(__FILE__) + "/../config/environment" unless defined?(RAILS_ROOT)

require 'spec/autorun'
require 'spec/rails'
require 'rake'
require 'ruby-debug' unless RUBY_VERSION > '1.9'
require 'authlogic/test_case'

require 'database_cleaner'

#Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}

require 'remarkable_rails'
require 'remarkable_paperclip'
Remarkable.add_locale "#{RAILS_ROOT}/vendor/remarkable/pt-BR.yml"
Remarkable.locale = :'pt-BR'

require 'factory_girl'
Dir["#{RAILS_ROOT}/spec/factories/**/*.rb"].each {|f| require f}


Spec::Runner.configure do |config|
  config.use_transactional_fixtures = true
  config.use_instantiated_fixtures  = false
  config.fixture_path = RAILS_ROOT + '/spec/fixtures/'

  config.before(:suite) do
    DatabaseCleaner.strategy = :truncation
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end

end

