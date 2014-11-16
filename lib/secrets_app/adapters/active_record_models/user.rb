require 'active_record'

module SecretsApp
  module Adapters
    module ActiveRecordModels
      class User < ::ActiveRecord::Base
        has_many :billings
        has_many :projects
      end
    end
  end
end
