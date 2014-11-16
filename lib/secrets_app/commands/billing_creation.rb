require 'secrets_app/business/billing'
require 'secrets_app/repository'
require 'secrets_app/validations/billing_creation'

module SecretsApp
  class BillingCreation < Struct.new(:attributes)
    class InvalidRecord < ArgumentError; end

    def exec
      billing    = Billing.new(attributes)
      validation = Validations::BillingCreation.new(billing)
      if validation.has_errors?
        raise InvalidRecord.new(validation.errors)
      end

      Repository.for(:billing).save(billing)

      billing
    end
  end
end
