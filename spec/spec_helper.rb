require "bundler/setup"
require "bool_at"
require "pry"

require 'active_record/railtie'
ActiveRecord::Base.logger = Logger.new(STDERR)
ActiveRecord::Base.logger.level = 3


class Post < ActiveRecord::Base; end

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.before(:all) do
    Time.zone = "Singapore"

    ActiveRecord::Base.establish_connection(
      adapter: "sqlite3",
      encoding: 'unicode',
      database: "bool_at_test",
    )
    create_database
  end

  config.after(:all) do
    drop_database
  end

  config.after(:each) do
    Post.delete_all
  end
end

def create_database
  ActiveRecord::Schema.define(:version => 1) do
    create_table :posts do |t|
      t.timestamp :published_at
      t.timestamps null: true
    end
  end
end

def drop_database
  ActiveRecord::Base.connection.tables.each do |table|
    ActiveRecord::Base.connection.drop_table(table)
  end
end
