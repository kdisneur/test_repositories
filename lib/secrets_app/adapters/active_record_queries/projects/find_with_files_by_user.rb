module SecretsApp
  module Adapters
    module ActiveRecordQueries
      module Projects
        class FindWithFilesByUser < Struct.new(:adapter, :user_id)
          def query
            adapter.class_for_table(:projects).where(user_id: user_id).includes(:files).map do |project|
              project.attributes.merge(files: project.files.map(&:attributes))
            end
          end
        end
      end
    end
  end
end
