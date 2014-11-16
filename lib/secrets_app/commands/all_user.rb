require 'secrets_app/repository'

module SecretsApp
  class AllUser
    def query
      Repository.for(:user).all
    end
  end
end
