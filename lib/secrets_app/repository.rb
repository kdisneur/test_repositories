module SecretsApp
  class Repository
    def self.define(name)
      Definition.new(self, name)
    end

    def self.for(name)
      repositories[name]
    end

    def self.repositories
      @repositories ||= {}
    end

    def self.run_all_migrations
        uniq_adapters.each(&:run_migrations)
    end

    class Definition < Struct.new(:repository_container, :name)
      def backed_by(backend)
        repository_container.add(name, backend)
      end
    end

    def self.add(name, backend)
      repositories[name] = backend
    end

    def self.uniq_adapters
      repositories.values.map { |repository| repository.adapter }.uniq
    end
  end
end
