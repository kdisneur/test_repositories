module SecretsApp
  module Adapters
    module InMemoryQueries
      module Projects
        class FindWithFilesByUser < Struct.new(:adapter, :user_id)
          def query
            projects = adapter.table(:projects).records.select { |project| project[:user_id] == user_id }
            projects.map { |project| project.merge(files: adapter.query(:files, :find_by_project, project[:id])) }
          end
        end
      end
    end
  end
end
