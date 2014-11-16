module SecretsApp
  class Environment
    attr_reader :name

    def initialize(environment = nil)
      define(environment)
      define(ENV['APP_ENV']) unless already_defined?
      define(:development) unless already_defined?
    end

    def development?
      name == :development
    end

    def test?
      name == :test
    end

    def production?
      name == :production
    end

    private

    def already_defined?
      !!name
    end

    def define(name)
      return unless name
      @name = name.to_sym
    end
  end
end
