module SecretsApp
  module Adapters
    module InMemoryQueries
      module BillingUsers
        class All < Struct.new(:adapter)
          def query
            all_users = adapter.table(:users).records.map do |user_record|
              user_record.merge(billings: adapter.query(:billings, :find_by_user, user_record[:id]))
            end

            all_users.select { |user| !user[:billings].empty? }
          end
        end
      end
    end
  end
end

