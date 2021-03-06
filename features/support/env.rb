require 'coveralls'
Coveralls.wear_merged!('rails')

require 'cucumber/rails'
require 'capybara/poltergeist'
require 'capybara-screenshot/cucumber'

ActionController::Base.allow_rescue = false

  begin
    DatabaseCleaner.strategy = :transaction
  rescue NameError
    raise "You need to add database_cleaner to your Gemfile (in the :test group) if you wish to use it."
  end

Cucumber::Rails::Database.javascript_strategy = :truncation

Capybara.register_driver :poltergeist do |app|
  Capybara::Poltergeist::Driver.new(app, js_errors: true,
                                    phantomjs_options: ['--ssl-protocol=tlsv1.2', '--ignore-ssl-errors=yes'])
end

Capybara.javascript_driver = :poltergeist
Capybara.default_max_wait_time = 20
