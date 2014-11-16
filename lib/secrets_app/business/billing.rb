require 'virtus'

module SecretsApp
  class Billing
    include Virtus.model

    attribute :id,       Integer
    attribute :amount,   Integer
    attribute :user_id,  Integer
    attribute :date,     Date
  end
end
