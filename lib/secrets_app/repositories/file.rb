require 'base64'

module SecretsApp
  module Repositories
   class File < Struct.new(:business_class, :adapter)
     def save(file)
       file.attributes = adapter.save(:files, file.attributes)
     end
   end
  end
end
