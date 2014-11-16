require 'secrets_app/business/project'
require 'secrets_app/repository'
require 'secrets_app/validations/project_creation'

module SecretsApp
  class ProjectCreation < Struct.new(:attributes)
    class InvalidRecord < ArgumentError; end

    def exec
      project    = Project.new(attributes)
      validation = Validations::ProjectCreation.new(project)
      if validation.has_errors?
        raise InvalidRecord.new(validation.errors)
      end

      Repository.for(:project).save(project)

      project
    end
  end
end
