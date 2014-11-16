require 'virtus'
require 'secrets_app/business/user_project'

module SecretsApp
  class User
    include Virtus.model

    attribute :id,       Integer
    attribute :name,     String
    attribute :projects, Array[UserProject]
  end
end
