module SecretsApp
  module Adapters
    module InMemoryQueries
      module Files
        class FindByProject < Struct.new(:adapter, :project_id)
          def query
            adapter.table(:files).records.select { |file| file[:project_id] == project_id }
          end
        end
      end
    end
  end
end
