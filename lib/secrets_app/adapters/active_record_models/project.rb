require 'active_record'

module SecretsApp
  module Adapters
    module ActiveRecordModels
      class Project < ::ActiveRecord::Base
        has_many   :files
        belongs_to :user
      end
    end
  end
end
