require 'virtus'
require 'secrets_app/business/file'

module SecretsApp
  class Project
    include Virtus.model

    attribute :id,      Integer
    attribute :name,    String
    attribute :files,   Array[File]
    attribute :user_id, Integer
  end
end
