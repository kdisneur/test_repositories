require 'date'

require './config/dependencies'
require 'secrets_app/commands/all_user'
require 'secrets_app/commands/all_billing_user'
require 'secrets_app/commands/all_projects_for_user'
require 'secrets_app/commands/project_creation'
require 'secrets_app/commands/billing_creation'
require 'secrets_app/commands/file_creation'
require 'secrets_app/commands/user_creation'

SecretsApp::UserCreation.new(name: 'Clarisse').exec
user = SecretsApp::UserCreation.new(name: 'Kevin').exec
SecretsApp::BillingCreation.new(amount: 13.37, date: Date.today, user_id: user.id).exec
project = SecretsApp::ProjectCreation.new(name: 'Project 1', user_id: user.id).exec
SecretsApp::ProjectCreation.new(name: 'Project 2', user_id: user.id).exec
SecretsApp::FileCreation.new(name: 'secrets.yml', content: File.join(File.dirname(__FILE__), 'secrets.yml'), project_id: project.id).exec

puts 'All User'
puts SecretsApp::AllUser.new.query.inspect
# =>
# [
#   #<SecretsApp::User:0x007 @name="Clarisse", @id=1, @projects=[]>,
#   #<SecretsApp::User:0x008 @name="Kevin", @id=2, @projects=[#<SecretsApp::UserProject:0x009 @name="Project 1", @id=1>, #<SecretsApp::UserProject:0x010 @name="Project 2", @id=2>]>
# ]

puts 'All Billing User'
puts SecretsApp::AllBillingUser.new.query.inspect
# =>
# [
#   #<SecretsApp::BillingUser:0x011 @id=2, @name="Kevin", @billings=[#<SecretsApp::UserBilling:0x012 @amount=13, @date=#<Date: 2014-11-16 ((2456978j,0s,0n),+0s,2299161j)>, @id=1>]>
# ]

puts 'All Projects for User Kevin'
puts SecretsApp::AllProjectsForUser.new(user.id).query.inspect
# =>
# [
#   #<SecretsApp::Project:0x013 @name="Project 1", @user_id=2, @id=1, @files=[#<SecretsApp::File:0x014 @name="secrets.yml", @content="examples/secrets.yml", @project_id=1, @id=1>]>,
#   #<SecretsApp::Project:0x015 @name="Project 2", @user_id=2, @id=2, @files=[]>
# ]
