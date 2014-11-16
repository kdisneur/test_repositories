module SecretsApp
  module Adapters
    module InMemoryQueries
      module Billings
        class FindByUser < Struct.new(:adapter, :user_id)
          def query
            adapter.table(:billings).records.select { |billing| billing[:user_id] == user_id }
          end
        end
      end
    end
  end
end
