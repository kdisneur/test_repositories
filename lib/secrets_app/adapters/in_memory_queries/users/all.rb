module SecretsApp
  module Adapters
    module InMemoryQueries
      module Users
        class All < Struct.new(:adapter)
          def query
            adapter.table(:users).records.map do |user_record|
              user_record.merge(projects: adapter.query(:projects, :find_by_user, user_record[:id]))
            end
          end
        end
      end
    end
  end
end
