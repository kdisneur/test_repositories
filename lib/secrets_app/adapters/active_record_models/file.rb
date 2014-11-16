require 'active_record'

module SecretsApp
  module Adapters
    module ActiveRecordModels
      class File < ::ActiveRecord::Base
        belongs_to :project
      end
    end
  end
end
