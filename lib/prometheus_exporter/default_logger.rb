# frozen_string_literal: true

require 'forwardable'
require 'logger'
require 'singleton'

module PrometheusExporter
  class DefaultLogger
    extend Forwardable
    include Singleton

    def_delegators :logger, :error

    def logger
      @logger ||= Logger.new(STDERR)
    end
  end
end
