require 'validation'
require 'validation/rule/not_empty'
require 'validation/rule/numeric'

module SecretsApp
  module Validations
    class BillingCreation < Validation::Validator
      include Validation

      rule :amount,  :numeric
      rule :user_id, :numeric

      def has_errors?
        !valid?
      end
    end
  end
end
