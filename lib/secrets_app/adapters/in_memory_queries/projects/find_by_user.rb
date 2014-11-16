module SecretsApp
  module Adapters
    module InMemoryQueries
      module Projects
        class FindByUser < Struct.new(:adapter, :user_id)
          def query
            adapter.table(:projects).records.select { |project| project[:user_id] == user_id }
          end
        end
      end
    end
  end
end
