require 'secrets_app'
require './config/dependencies'
require 'secrets_app/repository'

desc 'Migrate the database'
task :migrate do
  SecretsApp::Repository.run_all_migrations
end
