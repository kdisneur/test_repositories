module SecretsApp
  module Adapters
    module ActiveRecordQueries
      module BillingUsers
        class All < Struct.new(:adapter)
          def query
            adapter.class_for_table(:users).joins(:billings).includes(:billings).map do |user|
              user.attributes.merge(billings: user.billings.map(&:attributes))
            end
          end
        end
      end
    end
  end
end
