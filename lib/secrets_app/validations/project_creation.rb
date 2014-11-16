require 'validation'
require 'validation/rule/not_empty'
require 'validation/rule/numeric'

module SecretsApp
  module Validations
    class ProjectCreation < Validation::Validator
      include Validation

      rule :name,    :not_empty
      rule :user_id, :numeric

      def has_errors?
        !valid?
      end
    end
  end
end
