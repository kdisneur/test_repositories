require 'secrets_app/repository'

module SecretsApp
  class AllBillingUser
    def query
      Repository.for(:billing_user).all
    end
  end
end
