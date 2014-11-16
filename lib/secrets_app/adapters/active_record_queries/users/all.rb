module SecretsApp
  module Adapters
    module ActiveRecordQueries
      module Users
        class All < Struct.new(:adapter)
          def query
            adapter.class_for_table(:users).includes(:projects).map do |user|
              user.attributes.merge(projects: user.projects.map(&:attributes))
            end
          end
        end
      end
    end
  end
end
