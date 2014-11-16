require 'virtus'

module SecretsApp
  class ProjectFile
    include Virtus.model

    attribute :id,         Integer
    attribute :name,       String
  end
end
