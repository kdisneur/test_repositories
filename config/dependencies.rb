require 'secrets_app'
require 'secrets_app/business/billing'
require 'secrets_app/business/billing_user'
require 'secrets_app/business/user'
require 'secrets_app/business/project'
require 'secrets_app/repositories/billing'
require 'secrets_app/repositories/billing_user'
require 'secrets_app/repositories/file'
require 'secrets_app/repositories/user'
require 'secrets_app/repositories/project'
require 'secrets_app/repository'

SecretsApp.define do |config|
  adapter = nil

  config.when_test do
    require 'secrets_app/adapters/in_memory'
    adapter = SecretsApp::Adapters::InMemory.new
  end

  config.when_production do
    require 'secrets_app/adapters/active_record'
    adapter = SecretsApp::Adapters::ActiveRecord.new
  end

  config.when_development do
    require 'secrets_app/adapters/active_record'
    adapter = SecretsApp::Adapters::ActiveRecord.new
  end

  SecretsApp::Repository.define(:billing).backed_by(SecretsApp::Repositories::Billing.new(SecretsApp::Billing, adapter))
  SecretsApp::Repository.define(:billing_user).backed_by(SecretsApp::Repositories::BillingUser.new(SecretsApp::BillingUser, adapter))
  SecretsApp::Repository.define(:file).backed_by(SecretsApp::Repositories::File.new(SecretsApp::File, adapter))
  SecretsApp::Repository.define(:project).backed_by(SecretsApp::Repositories::Project.new(SecretsApp::Project, adapter))
  SecretsApp::Repository.define(:user).backed_by(SecretsApp::Repositories::User.new(SecretsApp::User, adapter))
end
