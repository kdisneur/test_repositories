require 'virtus'
require 'secrets_app/business/file'

module SecretsApp
  class UserProject
    include Virtus.model

    attribute :id,      Integer
    attribute :name,    String
  end
end
