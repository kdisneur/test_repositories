module SecretsApp
  module Adapters
    class InMemory
      def run_migrations; end

      def save(table_name, attributes)
        on_table(table_name) do |table|
          table.save(attributes)
        end
      end

      def query(module_name, query_name, *parameters)
        query_class(module_name, query_name).new(*[self, *parameters]).query
      end

      def table(table_name)
        database[table_name] ||= Table.new
      end

      private

      def database
        @database ||= {}
      end

      def on_table(table_name, &block)
        block.call(table(table_name))
      end

      def query_class(module_name, query_name)
        require "secrets_app/adapters/in_memory_queries/#{module_name}/#{query_name}"
        InMemoryQueries.const_get(module_name.to_s.camelize).const_get(query_name.to_s.camelize)
      end

      class Table
        def records
          data.values
        end

        def save(attributes)
          if attributes[:id]
            update(attributes)
          else
            create(attributes)
          end
        end

        private

        def create(attributes)
          id       = next_id
          data[id] = attributes.merge(id: id)
        end

        def data
          @data ||= {}
        end

        def next_id
          @max_id ||= 0
          @max_id  += 1
        end

        def update(attributes)
          data[id] = attributes
        end
      end
    end
  end
end
