require 'validation'
require 'validation/rule/not_empty'

module SecretsApp
  module Validations
    class UserCreation < Validation::Validator
      include Validation

      rule :name, :not_empty

      def has_errors?
        !valid?
      end
    end
  end
end
