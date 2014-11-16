require 'virtus'

module SecretsApp
  class File
    include Virtus.model

    attribute :id,         Integer
    attribute :name,       String
    attribute :content,    ::File
    attribute :project_id, Integer
  end
end
