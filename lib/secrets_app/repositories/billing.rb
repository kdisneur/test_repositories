module SecretsApp
  module Repositories
   class Billing < Struct.new(:business_class, :adapter)
     def save(billing)
       billing.attributes = adapter.save(:billings, billing.attributes)
     end
   end
  end
end
