require 'ext/string.rb'
require 'secrets_app/configuration'
require 'secrets_app/environment'

module SecretsApp
  def self.config
    @@config ||= Configuration.new(environment)
  end

  def self.define(&block)
    block.call(config)
  end

  def self.environment
    @@environment ||= Environment.new
  end

  def self.root
    root = ::File.dirname(::File.dirname(__FILE__))
    def root.join(*params)
      ::File.join(self, *params)
    end

    root
  end
end
