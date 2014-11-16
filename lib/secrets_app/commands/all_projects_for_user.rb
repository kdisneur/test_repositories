require 'secrets_app/repository'

module SecretsApp
  class AllProjectsForUser < Struct.new(:user_id)
    def query
      Repository.for(:project).find_by_user_id(user_id)
    end
  end
end
