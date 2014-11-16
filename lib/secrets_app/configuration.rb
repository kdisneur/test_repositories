module SecretsApp
  class Configuration < Struct.new(:environment)
    def when_development(&block)
      block.call if environment.development?
    end

    def when_production(&block)
      block.call if environment.production?
    end

    def when_test(&block)
      block.call if environment.test?
    end

    def when_production(&block)
      block.call if environment.production?
    end
  end
end
