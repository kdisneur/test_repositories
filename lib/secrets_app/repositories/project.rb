module SecretsApp
  module Repositories
   class Project < Struct.new(:business_class, :adapter)
     def save(project)
       project.attributes = adapter.save(:projects, project.attributes)
     end

     def find_by_user_id(user_id)
       adapter.query(:projects, :find_with_files_by_user, user_id).map(&method(:build_business))
     end

     def build_business(attributes)
       business_class.new(attributes)
     end
   end
  end
end
