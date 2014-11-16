require 'active_record'

module SecretsApp
  module Adapters
    module ActiveRecordModels
      class Billing < ::ActiveRecord::Base
        belongs_to :user
      end
    end
  end
end
