require 'virtus'
require 'secrets_app/business/billing'

module SecretsApp
  class BillingUser
    include Virtus.model

    attribute :id,       Integer
    attribute :name,     String
    attribute :billings, Array[Billing]
  end
end
