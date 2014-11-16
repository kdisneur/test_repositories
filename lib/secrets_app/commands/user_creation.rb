require 'secrets_app/business/user'
require 'secrets_app/repository'
require 'secrets_app/validations/user_creation'

module SecretsApp
  class UserCreation < Struct.new(:attributes)
    class InvalidRecord < ArgumentError; end

    def exec
      user       = User.new(attributes)
      validation = Validations::UserCreation.new(user)
      if validation.has_errors?
        raise InvalidRecord.new(validation.errors)
      end

      Repository.for(:user).save(user)

      user
    end
  end
end
