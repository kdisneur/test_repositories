require 'secrets_app/business/file'
require 'secrets_app/repository'
require 'secrets_app/validations/file_creation'

module SecretsApp
  class FileCreation < Struct.new(:attributes)
    class InvalidRecord < ArgumentError; end

    def exec
      file       = File.new(attributes)
      validation = Validations::FileCreation.new(file)
      if validation.has_errors?
        raise InvalidRecord.new(validation.errors)
      end

      Repository.for(:file).save(file)

      file
    end
  end
end
