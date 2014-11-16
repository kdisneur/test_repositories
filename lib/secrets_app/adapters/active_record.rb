require 'active_record'
require 'logger'
require 'yaml'

require 'secrets_app/adapters/active_record_models/all'

module SecretsApp
  module Adapters
    class ActiveRecord
      def initialize
        establish_connection
      end

      def class_for_table(table_name)
        classes[table_name]
      end

      def query(module_name, query_name, *parameters)
        query_class(module_name, query_name).new(*[self, *parameters]).query
      end

      def run_migrations
        migrations_folder = ::File.join(::File.dirname(__FILE__), 'active_record_models', 'migrate')
        ::ActiveRecord::Migrator.migrate(migrations_folder, ENV['VERSION'] ? ENV['VERSION'].to_i : nil )
      end

      def save(table_name, attributes)
        on_class(table_name) do |klass|
          if attributes[:id]
            object = klass.find(attributes[:id]).assign(attributes.reject { |attribute| [:id].include?(attribute) })
            object.save!
          else
            object = klass.create!(attributes)
          end

          object.attributes
        end
      end

      private

      def establish_connection
        database_file_path          = SecretsApp.root.join('config', 'database.yml')
        active_record_configuration = YAML::load(::File.open(database_file_path))[SecretsApp.environment.name.to_s]

        ::ActiveRecord::Base.establish_connection(active_record_configuration)
        ::ActiveRecord::Base.logger = Logger.new(::File.open(SecretsApp.root.join('logs', 'database.log'), 'a'))
      end

      def classes
        @classes ||= ::ActiveRecord::Base.descendants.reduce({}) { |classes, klass| classes.merge(klass.table_name.to_sym => klass) }
        @classes
      end

      def on_class(table_name, &block)
        block.call(class_for_table(table_name))
      end

      def query_class(module_name, query_name)
        require "secrets_app/adapters/active_record_queries/#{module_name}/#{query_name}"
        ActiveRecordQueries.const_get(module_name.to_s.camelize).const_get(query_name.to_s.camelize)
      end
    end
  end
end
