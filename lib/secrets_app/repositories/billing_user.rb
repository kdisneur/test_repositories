module SecretsApp
  module Repositories
   class BillingUser < Struct.new(:business_class, :adapter)
     def save(user)
       user.attributes = adapter.save(:users, user.attributes)
     end

     def all
       adapter.query(:billing_users, :all).map(&method(:build_business))
     end

     private

     def build_business(attributes)
       business_class.new(attributes)
     end
   end
  end
end
